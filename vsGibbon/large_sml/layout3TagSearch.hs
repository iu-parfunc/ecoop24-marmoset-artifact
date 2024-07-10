import Basics
import GenerateLayout3

type Text = Vector Char


emphKeywordInTag :: Text -> Blog -> Blog  
emphKeywordInTag keyword blogs = case blogs of 
                                    End -> End
                                    Layout3 tags rst content header id author date -> let present     = searchBlogTags keyword tags
                                                                                        in if present then 
                                                                                            let 
                                                                                                newContent  = case content of 
                                                                                                                         Content block -> Content (emphasizeKeywordInBlock keyword block) 
                                                                                                newRst      = emphKeywordInTag keyword rst 
                                                                                              in Layout3 tags newRst newContent header id author date
                                                                                           else 
                                                                                            let 
                                                                                                newRst = emphKeywordInTag keyword rst 
                                                                                              in Layout3 tags newRst content header id author date

gibbon_main = 
    let 
        blogs     = mkBlogs_layout3  400000 500 5
        keyword :: Vector Char  
        keyword = "a"
        newblgs = iterate (emphKeywordInTag keyword blogs)
    in blogLength newblgs == blogLength blogs
