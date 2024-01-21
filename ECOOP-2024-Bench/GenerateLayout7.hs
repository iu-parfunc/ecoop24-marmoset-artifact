module GenerateLayout7 where
import Basics

type Text = Vector Char

mkBlogs_layout7 :: Int -> Int -> Int -> Blog
mkBlogs_layout7 length contlen taglen =
   if length <= 0 then End
   else 
      let 
          rst     = (mkBlogs_layout7 (length - 1) contlen taglen)
          content = (Content (Plain (mkRandomInlineList contlen)))
          header  = (Header (getRandomString 5))
          id      = (ID (10 - (mod length 10)))
          author  = (Author (getRandomString 5))
          date    = (Date (getRandomString 5))
          tags    = (TagList (mkSomeTags taglen))          
         in Layout7 rst content header id author date tags
