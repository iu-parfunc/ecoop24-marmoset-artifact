import Basics
import GenerateLayout5

type Text = Vector Char


filterByKeywordInTagList :: Text -> Blog -> Blog 
filterByKeywordInTagList keyword blogs = case blogs of 
                                            End -> End 
                                            Layout5 rst tags content header id author date -> let present = searchBlogTags keyword tags
                                                                                                in if present then 
                                                                                                    let newRst  = filterByKeywordInTagList keyword rst
                                                                                                      in Layout5 newRst tags content header id author date
                                                                                                   else filterByKeywordInTagList keyword rst 

checkBlogs :: Text -> Blog -> Bool 
checkBlogs keyword blogs = case blogs of 
                                            End -> True
                                            Layout5 rst tags content header id author date -> let present = searchBlogTags keyword tags
                                                                                                in present && (checkBlogs keyword rst)                                                                                                    
                                                                                                   
-- main function 
gibbon_main = 
   let 
       blogs     = mkBlogs_layout5 100000 500 5
       keyword :: Vector Char  
       keyword = "a"
       newblgs = iterate (filterByKeywordInTagList keyword blogs)
   in checkBlogs keyword newblgs
