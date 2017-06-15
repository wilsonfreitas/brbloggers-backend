library(magrittr)
library(purrr)
library(stringr)
library(tidyRSS)
library(mercury)
library(dplyr)
library(readr)

# secure::add_user("daniel", public_key = secure::local_key())
# secure::encrypt("MERCURY_KEY", key = "xxxxxxxxxxxxxxxx")
# secure::encrypt("NETLIFY_BUILD_HOOK", key = "xxxxxxxxxxxxxxx")


Sys.setenv(MERCURY_KEY = secure::decrypt("MERCURY_KEY")$key)


# Auxiliary functions -----------------------------------------------------

safe_tidyfeed <- possibly(tidyfeed, NA, quiet = TRUE)
safe_mercury <- possibly(function(x){
  req <- mercury(x)
  if(is.null(req$content)){
    return(NA)
  } else {
    return(req$content)
  }
}, NA, quiet = FALSE)

fix_file_name <- function(dir, item_link, feed_link){
  # transform item link
  item_link <- item_link %>%
    str_replace(fixed(feed_link), "") %>%
    str_replace("/$", "") %>%
    str_extract("/[^/]+$") %>%
    str_replace_all("%", "-") %>%
    str_replace_all("[\\(\\)]", "")
  
  sprintf(
    "content/%s/%s", 
    dir, 
    item_link
  )
}

create_md_header <- function(title, date, blog, original_url){
  sprintf(
  '+++\ntitle = "%s"\ndate = "%s"\ncategories = ["%s"]\noriginal_url = "%s"\n+++\n',
  title,
  date,
  blog,
  original_url
  )
}


# Get all feeds
source("feeds.R", local = TRUE)

message(sprintf("%02d blogs are watched", length(feeds)))

# verify and create necessary folders
for(blog in names(feeds)){
  if(!dir.exists(sprintf("content/%s", blog))){
    dir.create(path = sprintf("content/%s", blog)) 
    message(sprintf("content/%s was created", blog))
  }
}

# Download feeds ----------------------------------------------------------

posts <- readRDS("data/posts.rds")

all_feeds <- feeds %>%
  map_df(~safe_tidyfeed(.x$url), .id = "blog") %>%
  select(-starts_with("item_category"), -feed_update_period, -item_creator) %>%
  filter(
    item_date_published > lubridate::today() - 30 | # pegar o conteudo de posts recentes
      (!blog %in% unique(posts$blog)) # ou de blogs novos
  ) %>%
  mutate(item_content = map_chr(item_link, safe_mercury))


# Decide which posts will be written
new_posts <- setdiff(all_feeds, posts)

message(sprintf("%03d new posts", nrow(new_posts)))

posts <- bind_rows(posts, new_posts)
saveRDS(posts, "data/posts.rds")


# Write feeds to directory ------------------------------------------------
if(nrow(new_posts) > 0){
  for(i in 1:nrow(new_posts)){
    
    if(!is.na(new_posts$item_content[i])){
      
      file_name <- fix_file_name(
        new_posts$blog[i], 
        new_posts$item_link[i], 
        new_posts$feed_link[i]
      )
      
      # writing the html file
      write_lines(new_posts$item_content[i], sprintf("%s.html", file_name))
      
      # convert file to markdown
      if(rmarkdown::pandoc_available(error = FALSE)){
        rmarkdown::render(sprintf("%s.html", file_name), rmarkdown::md_document())
        
        # add the header and rewrite
        md_file <- read_file(sprintf("%s.md", file_name)) 
        
        readr::write_lines(
          sprintf(
            "%s\n%s",
            create_md_header(
              new_posts$item_title[i], 
              new_posts$item_date_published[i], 
              new_posts$blog[i],
              new_posts$item_link[i]
            ),
            md_file
          ), 
          sprintf("%s.md", file_name)
        )
        
      } 
      
      # delete html file
      file.remove(sprintf("%s.html", file_name))
      
    }
    
  }
}

# adicionar perguntas mais recentes do stack-overflow

all_sopt <- readRDS("data/sopt.rds")
sopt <- tidyfeed("https://pt.stackoverflow.com/feeds/tag?tagnames=r&sort=newest")

new_sopt <- setdiff(all_sopt, sopt)

all_sopt <- bind_rows(all_sopt, new_sopt)
saveRDS(all_sopt, "data/sopt.rds")

if(nrow(new_sopt) > 0){
  for(i in 1:nrow(new_sopt)){
    write_lines(
      sprintf(
        '+++\ntitle = "%s"\ndate = "%s"\ncategories = ["%s"]\noriginal_url = "%s"\n+++\n',
      new_sopt$item_title[i],
      new_sopt$item_date_updated[i],
      "sopt",
      new_sopt$item_link[i]
      ), 
      path = sprintf("content/sopt/%s.md", str_extract(sopt$item_link[i], "[^/]*$"))
    )
  }  
}















