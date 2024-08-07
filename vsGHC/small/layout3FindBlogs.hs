import MainGhc

insertKeywordInTagList :: Text -> Blog -> Blog 
insertKeywordInTagList keyword blogs = case blogs of 
                                            End -> End 
                                            Layout3 tags rst content header id author date -> let present = searchBlogTags keyword tags
                                                                                                in if present then 
                                                                                                    let newRst  = insertKeywordInTagList keyword rst
                                                                                                      in Layout3 tags newRst content header id author date
                                                                                                   else insertKeywordInTagList keyword rst 


-- main function 
main :: IO ()
main = 
    do let blogs1 = mkBlogs_layout3 100000 500 5 
       (newblog1, self1, batch1) <- benchFilterBlogsBasedOnKeywordInTagList insertKeywordInTagList ['a'] blogs1 1
       putStrLn $ "Length of new Blogs is: "
       print (blogLength newblog1)
       putStrLn $ "Done."
