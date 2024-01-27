import Basics
import GenerateLayout1 

type Text = Vector Char 


emphKeywordInContent :: Text -> Blog -> Blog
emphKeywordInContent keyword blogs = 
   case blogs of 
      End -> End 
      Layout1 header id author date content tags rst -> let newContent = case content of 
                                                                               Content block -> Content (emphasizeKeywordInBlock keyword block)
                                                            newRst     = emphKeywordInContent keyword rst 
                                                        in Layout1 header id author date newContent tags newRst
                                                        
                                                        

filterByKeywordInTagList :: Text -> Blog -> Blog 
filterByKeywordInTagList keyword blogs = case blogs of 
                                            End -> End 
                                            Layout1 header id author date content tags rst -> let present = searchBlogTags keyword tags
                                                                                                in if present then 
                                                                                                     let newRst  = filterByKeywordInTagList keyword rst
                                                                                                      in Layout4 tags content newRst header id author date
                                                                                                   else filterByKeywordInTagList keyword rst 
                                                                                                   

emphKeywordInTag :: Text -> Blog -> Blog
emphKeywordInTag keyword blogs = case blogs of 
                                    End -> End
                                    Layout1 header id author date content tags rst -> let present = searchBlogTags keyword tags
                                                                                          in if (present) 
                                                                                             then let newContent  = emphasizeBlogContent' keyword content 
                                                                                                      newRst      = emphKeywordInTag keyword rst
                                                                                                    in Layout1 header id author date newContent tags newRst
                                                                                             else
                                                                                               let newRst = emphKeywordInTag keyword rst
                                                                                                 in Layout1 header id author date content tags newRst
                                                                                                 
                                                                                                 
-- main function 
gibbon_main = 
   let blogs = mkBlogs_layout1 100000 150 10 
       keyword :: Vector Char  
       keyword = "a"
       _ = printsym (quote "EmphKeyword:\n")
       newblgs   = iterate (emphKeywordInContent keyword blogs)
       _ = printsym (quote "END\n")
       _ = printsym (quote "EmphKeywordInTag:\n")
       newblgs'  = iterate (emphKeywordInTag keyword newblgs)
       _ = printsym (quote "END\n") 
       _ = printsym (quote "FilterBlogs:\n")
       newblgs'' = iterate (filterByKeywordInTagList keyword newblgs')
       _ = printsym (quote "END\n")
   in ()
