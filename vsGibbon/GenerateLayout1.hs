module GenerateLayout1 where
import Basics

type Text = Vector Char


-- Int:length, Int:Content, Int: Tags
mkBlogs_layout1 :: Int -> Int -> Int -> Blog
mkBlogs_layout1 length contlen taglen =
   if length <= 0 then End
   else 
      let
          header = (Header (getRandomString 5))
          id     = (ID (10 - (mod length 10)))
          author = (Author (getRandomString 5))
          date   =  (Date (getRandomString 5))
          content = (Content (Plain (mkRandomInlineList contlen)))
          tags    = (TagList (mkSomeTags taglen))
          rst     = (mkBlogs_layout1 (length - 1) contlen taglen)
         in Layout1 header id author date content tags rst



--- Traversal 1 (Filter blogs)
-- Content -> 500 
-- Tags    -> 5 
-- Blogs   -> 1,000,000
-- Input always going to then branch


-- Traversal 2 (EmphContent)
-- Content -> 50
-- Tags    -> 10
-- Blogs   -> 1,000,000
-- Input always going to then branch 


-- Traversal 3 (SearchTag emph Content)
-- Content -> 500 
-- Tags    -> 5 
-- Blogs -> 400,000
-- Input always going to then branch

--Testing First Touch 
-- Content -> 50
-- Tags    -> 50
-- Blogs -> 400,000
--

-- manyFuncs 
-- Content -> 150
-- Tags -> 10 
-- Blogs -> 1000000
