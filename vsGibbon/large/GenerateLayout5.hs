module GenerateLayout5 where
import Basics

type Text = Vector Char


mkBlogs_layout5 :: Int -> Int -> Int -> Blog
mkBlogs_layout5 length contlen taglen =
   if length <= 0 then End
   else 
      let 
          rst = (mkBlogs_layout5 (length - 1) contlen taglen)
          tags = (TagList (mkSomeTags taglen))
          content = (Content (Plain (mkRandomInlineList contlen)))
          header  =  (Header (getRandomString 5))
          id      = (ID (10 - (mod length 10)))
          author = (Author (getRandomString 5))
          date   = (Date (getRandomString 5))
         in Layout5 rst tags content header id author date
