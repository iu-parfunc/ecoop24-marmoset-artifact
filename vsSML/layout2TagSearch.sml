datatype dat_Inline = Str of (CharArraySlice.slice) | Emph of ( dat_PList_v_1072)| Space 
and dat_Block = Plain of ( dat_PList_v_1072) | Null
and dat_BlogHeader = Header of (CharArraySlice.slice)
and dat_BlogId = ID of (int)
and dat_BlogAuthor = Author of (CharArraySlice.slice)
and dat_BlogDate = Date of (CharArraySlice.slice)
and dat_BlogContent = Content of ( dat_Block)
and dat_BlogTags = TagList of ( dat_PList_v_1073)
and dat_Blog = End | Layout1 of ( dat_BlogHeader  *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogContent *  dat_BlogTags *  dat_Blog)| Layout2 of ( dat_BlogContent  *  dat_BlogTags *  dat_Blog *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout3 of ( dat_BlogTags  *  dat_Blog *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout4 of ( dat_BlogTags  *  dat_BlogContent *  dat_Blog *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout5 of ( dat_Blog  *  dat_BlogTags *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout6 of ( dat_BlogHeader  *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogContent *  dat_Blog *  dat_BlogTags)| Layout7 of ( dat_Blog  *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogTags)| Layout8 of ( dat_BlogContent  *  dat_Blog *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogHeader *  dat_BlogTags)
and dat_PList_v_1073 = Nil_v_1073 | Cons_v_1073 of (CharArraySlice.slice  *  dat_PList_v_1073)
and dat_PList_v_1072 = Nil_v_1072 | Cons_v_1072 of ( dat_Inline  *  dat_PList_v_1072)
and dat_PList_v_1075 = Nil_v_1075 | Cons_v_1075 of ( dat_Block  *  dat_PList_v_1075) ;

fun internal_print_PList_v_1073 (arg_2420_3640_4764) = (case arg_2420_3640_4764 of Nil_v_1073 => 
  let val wildcard_2421_3641_4765 = (print "(Nil_v_1073") in 
  let val wildcard_2422_3642_4766 = (print ")") in () end end 
  | Cons_v_1073 (x_2423_3643_4767 , x_2424_3644_4768) => 
  let val wildcard_2427_3645_4769 = (print "(Cons_v_1073") in 
  let val wildcard_2430_3646_4770 = (print " ") in 
  let val y_2425_3647_4771 = (print "Vector") in 
  let val wildcard_2429_3648_4772 = (print " ") in 
  let val y_2426_3649_4773 = (internal_print_PList_v_1073 x_2424_3644_4768) in 
  let val wildcard_2428_3650_4774 = (print ")") in () end end end end end end);

fun internal_traverse_PList_v_1073 (arg_2415_3636_4760) = (case arg_2415_3636_4760 of Nil_v_1073 => () 
  | Cons_v_1073 (x_2416_3637_4761 , x_2417_3638_4762) => 
  let val y_2419_3639_4763 = (internal_traverse_PList_v_1073 x_2417_3638_4762) in () end);

fun internal_copy_without_ptrs_PList_v_1073 (arg_2410_3631_4755) = (case arg_2410_3631_4755 of Nil_v_1073 => Nil_v_1073 
  | Cons_v_1073 (x_2411_3632_4756 , x_2412_3633_4757) => 
  let val y_2414_3635_4759 = (internal_copy_without_ptrs_PList_v_1073 x_2412_3633_4757) in (Cons_v_1073 (x_2411_3632_4756 , y_2414_3635_4759)) end);

fun internal_copy_PList_v_1073 (arg_2405_3626_4750) = (case arg_2405_3626_4750 of Nil_v_1073 => Nil_v_1073 
  | Cons_v_1073 (x_2406_3627_4751 , x_2407_3628_4752) => 
  let val y_2409_3630_4754 = (internal_copy_PList_v_1073 x_2407_3628_4752) in (Cons_v_1073 (x_2406_3627_4751 , y_2409_3630_4754)) end);

fun internal_print_BlogTags (arg_1873_3094_4218) = (case arg_1873_3094_4218 of TagList (x_1874_3095_4219) => 
  let val wildcard_1876_3096_4220 = (print "(TagList") in 
  let val wildcard_1878_3097_4221 = (print " ") in 
  let val y_1875_3098_4222 = (internal_print_PList_v_1073 x_1874_3095_4219) in 
  let val wildcard_1877_3099_4223 = (print ")") in () end end end end);

fun internal_traverse_BlogTags (arg_1870_3091_4215) = (case arg_1870_3091_4215 of TagList (x_1871_3092_4216) => 
  let val y_1872_3093_4217 = (internal_traverse_PList_v_1073 x_1871_3092_4216) in () end);

fun internal_copy_without_ptrs_BlogTags (arg_1867_3088_4212) = (case arg_1867_3088_4212 of TagList (x_1868_3089_4213) => 
  let val y_1869_3090_4214 = (internal_copy_without_ptrs_PList_v_1073 x_1868_3089_4213) in (TagList (y_1869_3090_4214)) end);

fun internal_copy_BlogTags (arg_1864_3085_4209) = (case arg_1864_3085_4209 of TagList (x_1865_3086_4210) => 
  let val y_1866_3087_4211 = (internal_copy_PList_v_1073 x_1865_3086_4210) in (TagList (y_1866_3087_4211)) end);

fun internal_print_BlogDate (arg_1843_3064_4188) = (case arg_1843_3064_4188 of Date (x_1844_3065_4189) => 
  let val wildcard_1846_3066_4190 = (print "(Date") in 
  let val wildcard_1848_3067_4191 = (print " ") in 
  let val y_1845_3068_4192 = (print "Vector") in 
  let val wildcard_1847_3069_4193 = (print ")") in () end end end end);

fun internal_traverse_BlogDate (arg_1840_3062_4186) = (case arg_1840_3062_4186 of Date (x_1841_3063_4187) => ());

fun internal_copy_without_ptrs_BlogDate (arg_1837_3059_4183) = (case arg_1837_3059_4183 of Date (x_1838_3060_4184) => (Date (x_1838_3060_4184)));

fun internal_copy_BlogDate (arg_1834_3056_4180) = (case arg_1834_3056_4180 of Date (x_1835_3057_4181) => (Date (x_1835_3057_4181)));

fun internal_print_BlogAuthor (arg_1828_3050_4174) = (case arg_1828_3050_4174 of Author (x_1829_3051_4175) => 
  let val wildcard_1831_3052_4176 = (print "(Author") in 
  let val wildcard_1833_3053_4177 = (print " ") in 
  let val y_1830_3054_4178 = (print "Vector") in 
  let val wildcard_1832_3055_4179 = (print ")") in () end end end end);

fun internal_traverse_BlogAuthor (arg_1825_3048_4172) = (case arg_1825_3048_4172 of Author (x_1826_3049_4173) => ());

fun internal_copy_without_ptrs_BlogAuthor (arg_1822_3045_4169) = (case arg_1822_3045_4169 of Author (x_1823_3046_4170) => (Author (x_1823_3046_4170)));

fun internal_copy_BlogAuthor (arg_1819_3042_4166) = (case arg_1819_3042_4166 of Author (x_1820_3043_4167) => (Author (x_1820_3043_4167)));

fun internal_print_BlogId (arg_1813_3036_4160) = (case arg_1813_3036_4160 of ID (x_1814_3037_4161) => 
  let val wildcard_1816_3038_4162 = (print "(ID") in 
  let val wildcard_1818_3039_4163 = (print " ") in 
  let val y_1815_3040_4164 = (print(Int.toString(x_1814_3037_4161))) in 
  let val wildcard_1817_3041_4165 = (print ")") in () end end end end);

fun internal_traverse_BlogId (arg_1810_3034_4158) = (case arg_1810_3034_4158 of ID (x_1811_3035_4159) => ());

fun internal_copy_without_ptrs_BlogId (arg_1807_3031_4155) = (case arg_1807_3031_4155 of ID (x_1808_3032_4156) => (ID (x_1808_3032_4156)));

fun internal_copy_BlogId (arg_1804_3028_4152) = (case arg_1804_3028_4152 of ID (x_1805_3029_4153) => (ID (x_1805_3029_4153)));

fun internal_print_BlogHeader (arg_1798_3022_4146) = (case arg_1798_3022_4146 of Header (x_1799_3023_4147) => 
  let val wildcard_1801_3024_4148 = (print "(Header") in 
  let val wildcard_1803_3025_4149 = (print " ") in 
  let val y_1800_3026_4150 = (print "Vector") in 
  let val wildcard_1802_3027_4151 = (print ")") in () end end end end);

fun internal_traverse_BlogHeader (arg_1795_3020_4144) = (case arg_1795_3020_4144 of Header (x_1796_3021_4145) => ());

fun internal_copy_without_ptrs_BlogHeader (arg_1792_3017_4141) = (case arg_1792_3017_4141 of Header (x_1793_3018_4142) => (Header (x_1793_3018_4142)));

fun internal_copy_BlogHeader (arg_1789_3014_4138) = (case arg_1789_3014_4138 of Header (x_1790_3015_4139) => (Header (x_1790_3015_4139)));

fun internal_print_Inline (arg_1759_2984_4108) = (case arg_1759_2984_4108 of Str (x_1760_2985_4109) => 
  let val wildcard_1762_2986_4110 = (print "(Str") in 
  let val wildcard_1764_2987_4111 = (print " ") in 
  let val y_1761_2988_4112 = (print "Vector") in 
  let val wildcard_1763_2989_4113 = (print ")") in () end end end end 
  | Emph (x_1765_2990_4114) => 
  let val wildcard_1767_2991_4115 = (print "(Emph") in 
  let val wildcard_1769_2992_4116 = (print " ") in 
  let val y_1766_2993_4117 = (internal_print_PList_v_1072 x_1765_2990_4114) in 
  let val wildcard_1768_2994_4118 = (print ")") in () end end end end
  | Space => 
  let val wildcard_1770_2995_4119 = (print "(Space") in 
  let val wildcard_1771_2996_4120 = (print ")") in () end end)
and internal_print_PList_v_1072 (arg_2446_3666_4790) = (case arg_2446_3666_4790 of Nil_v_1072 => 
  let val wildcard_2447_3667_4791 = (print "(Nil_v_1072") in 
  let val wildcard_2448_3668_4792 = (print ")") in () end end 
  | Cons_v_1072 (x_2449_3669_4793 , x_2450_3670_4794) => 
  let val wildcard_2453_3671_4795 = (print "(Cons_v_1072") in 
  let val wildcard_2456_3672_4796 = (print " ") in 
  let val y_2451_3673_4797 = (internal_print_Inline x_2449_3669_4793) in 
  let val wildcard_2455_3674_4798 = (print " ") in 
  let val y_2452_3675_4799 = (internal_print_PList_v_1072 x_2450_3670_4794) in 
  let val wildcard_2454_3676_4800 = (print ")") in () end end end end end end);

fun internal_print_Block (arg_1781_3006_4130) = (case arg_1781_3006_4130 of Plain (x_1782_3007_4131) => 
  let val wildcard_1784_3008_4132 = (print "(Plain") in 
  let val wildcard_1786_3009_4133 = (print " ") in 
  let val y_1783_3010_4134 = (internal_print_PList_v_1072 x_1782_3007_4131) in 
  let val wildcard_1785_3011_4135 = (print ")") in () end end end end 
  | Null => 
  let val wildcard_1787_3012_4136 = (print "(Null") in 
  let val wildcard_1788_3013_4137 = (print ")") in () end end);

fun internal_print_BlogContent (arg_1858_3079_4203) = (case arg_1858_3079_4203 of Content (x_1859_3080_4204) => 
  let val wildcard_1861_3081_4205 = (print "(Content") in 
  let val wildcard_1863_3082_4206 = (print " ") in 
  let val y_1860_3083_4207 = (internal_print_Block x_1859_3080_4204) in 
  let val wildcard_1862_3084_4208 = (print ")") in () end end end end);

fun internal_print_Blog (arg_2218_3439_4563) = (case arg_2218_3439_4563 of End => 
  let val wildcard_2219_3440_4564 = (print "(End") in 
  let val wildcard_2220_3441_4565 = (print ")") in () end end 
  | Layout1 (x_2221_3442_4566 , x_2222_3443_4567, x_2223_3444_4568, x_2224_3445_4569, x_2225_3446_4570, x_2226_3447_4571, x_2227_3448_4572) => 
  let val wildcard_2235_3449_4573 = (print "(Layout1") in 
  let val wildcard_2243_3450_4574 = (print " ") in 
  let val y_2228_3451_4575 = (internal_print_BlogHeader x_2221_3442_4566) in 
  let val wildcard_2242_3452_4576 = (print " ") in 
  let val y_2229_3453_4577 = (internal_print_BlogId x_2222_3443_4567) in 
  let val wildcard_2241_3454_4578 = (print " ") in 
  let val y_2230_3455_4579 = (internal_print_BlogAuthor x_2223_3444_4568) in 
  let val wildcard_2240_3456_4580 = (print " ") in 
  let val y_2231_3457_4581 = (internal_print_BlogDate x_2224_3445_4569) in 
  let val wildcard_2239_3458_4582 = (print " ") in 
  let val y_2232_3459_4583 = (internal_print_BlogContent x_2225_3446_4570) in 
  let val wildcard_2238_3460_4584 = (print " ") in 
  let val y_2233_3461_4585 = (internal_print_BlogTags x_2226_3447_4571) in 
  let val wildcard_2237_3462_4586 = (print " ") in 
  let val y_2234_3463_4587 = (internal_print_Blog x_2227_3448_4572) in 
  let val wildcard_2236_3464_4588 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout2 (x_2244_3465_4589 , x_2245_3466_4590, x_2246_3467_4591, x_2247_3468_4592, x_2248_3469_4593, x_2249_3470_4594, x_2250_3471_4595) => 
  let val wildcard_2258_3472_4596 = (print "(Layout2") in 
  let val wildcard_2266_3473_4597 = (print " ") in 
  let val y_2251_3474_4598 = (internal_print_BlogContent x_2244_3465_4589) in 
  let val wildcard_2265_3475_4599 = (print " ") in 
  let val y_2252_3476_4600 = (internal_print_BlogTags x_2245_3466_4590) in 
  let val wildcard_2264_3477_4601 = (print " ") in 
  let val y_2253_3478_4602 = (internal_print_Blog x_2246_3467_4591) in 
  let val wildcard_2263_3479_4603 = (print " ") in 
  let val y_2254_3480_4604 = (internal_print_BlogHeader x_2247_3468_4592) in 
  let val wildcard_2262_3481_4605 = (print " ") in 
  let val y_2255_3482_4606 = (internal_print_BlogId x_2248_3469_4593) in 
  let val wildcard_2261_3483_4607 = (print " ") in 
  let val y_2256_3484_4608 = (internal_print_BlogAuthor x_2249_3470_4594) in 
  let val wildcard_2260_3485_4609 = (print " ") in 
  let val y_2257_3486_4610 = (internal_print_BlogDate x_2250_3471_4595) in 
  let val wildcard_2259_3487_4611 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout3 (x_2267_3488_4612 , x_2268_3489_4613, x_2269_3490_4614, x_2270_3491_4615, x_2271_3492_4616, x_2272_3493_4617, x_2273_3494_4618) => 
  let val wildcard_2281_3495_4619 = (print "(Layout3") in 
  let val wildcard_2289_3496_4620 = (print " ") in 
  let val y_2274_3497_4621 = (internal_print_BlogTags x_2267_3488_4612) in 
  let val wildcard_2288_3498_4622 = (print " ") in 
  let val y_2275_3499_4623 = (internal_print_Blog x_2268_3489_4613) in 
  let val wildcard_2287_3500_4624 = (print " ") in 
  let val y_2276_3501_4625 = (internal_print_BlogContent x_2269_3490_4614) in 
  let val wildcard_2286_3502_4626 = (print " ") in 
  let val y_2277_3503_4627 = (internal_print_BlogHeader x_2270_3491_4615) in 
  let val wildcard_2285_3504_4628 = (print " ") in 
  let val y_2278_3505_4629 = (internal_print_BlogId x_2271_3492_4616) in 
  let val wildcard_2284_3506_4630 = (print " ") in 
  let val y_2279_3507_4631 = (internal_print_BlogAuthor x_2272_3493_4617) in 
  let val wildcard_2283_3508_4632 = (print " ") in 
  let val y_2280_3509_4633 = (internal_print_BlogDate x_2273_3494_4618) in 
  let val wildcard_2282_3510_4634 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout4 (x_2290_3511_4635 , x_2291_3512_4636, x_2292_3513_4637, x_2293_3514_4638, x_2294_3515_4639, x_2295_3516_4640, x_2296_3517_4641) => 
  let val wildcard_2304_3518_4642 = (print "(Layout4") in 
  let val wildcard_2312_3519_4643 = (print " ") in 
  let val y_2297_3520_4644 = (internal_print_BlogTags x_2290_3511_4635) in 
  let val wildcard_2311_3521_4645 = (print " ") in 
  let val y_2298_3522_4646 = (internal_print_BlogContent x_2291_3512_4636) in 
  let val wildcard_2310_3523_4647 = (print " ") in 
  let val y_2299_3524_4648 = (internal_print_Blog x_2292_3513_4637) in 
  let val wildcard_2309_3525_4649 = (print " ") in 
  let val y_2300_3526_4650 = (internal_print_BlogHeader x_2293_3514_4638) in 
  let val wildcard_2308_3527_4651 = (print " ") in 
  let val y_2301_3528_4652 = (internal_print_BlogId x_2294_3515_4639) in 
  let val wildcard_2307_3529_4653 = (print " ") in 
  let val y_2302_3530_4654 = (internal_print_BlogAuthor x_2295_3516_4640) in 
  let val wildcard_2306_3531_4655 = (print " ") in 
  let val y_2303_3532_4656 = (internal_print_BlogDate x_2296_3517_4641) in 
  let val wildcard_2305_3533_4657 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout5 (x_2313_3534_4658 , x_2314_3535_4659, x_2315_3536_4660, x_2316_3537_4661, x_2317_3538_4662, x_2318_3539_4663, x_2319_3540_4664) => 
  let val wildcard_2327_3541_4665 = (print "(Layout5") in 
  let val wildcard_2335_3542_4666 = (print " ") in 
  let val y_2320_3543_4667 = (internal_print_Blog x_2313_3534_4658) in 
  let val wildcard_2334_3544_4668 = (print " ") in 
  let val y_2321_3545_4669 = (internal_print_BlogTags x_2314_3535_4659) in 
  let val wildcard_2333_3546_4670 = (print " ") in 
  let val y_2322_3547_4671 = (internal_print_BlogContent x_2315_3536_4660) in 
  let val wildcard_2332_3548_4672 = (print " ") in 
  let val y_2323_3549_4673 = (internal_print_BlogHeader x_2316_3537_4661) in 
  let val wildcard_2331_3550_4674 = (print " ") in 
  let val y_2324_3551_4675 = (internal_print_BlogId x_2317_3538_4662) in 
  let val wildcard_2330_3552_4676 = (print " ") in 
  let val y_2325_3553_4677 = (internal_print_BlogAuthor x_2318_3539_4663) in 
  let val wildcard_2329_3554_4678 = (print " ") in 
  let val y_2326_3555_4679 = (internal_print_BlogDate x_2319_3540_4664) in 
  let val wildcard_2328_3556_4680 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout6 (x_2336_3557_4681 , x_2337_3558_4682, x_2338_3559_4683, x_2339_3560_4684, x_2340_3561_4685, x_2341_3562_4686, x_2342_3563_4687) => 
  let val wildcard_2350_3564_4688 = (print "(Layout6") in 
  let val wildcard_2358_3565_4689 = (print " ") in 
  let val y_2343_3566_4690 = (internal_print_BlogHeader x_2336_3557_4681) in 
  let val wildcard_2357_3567_4691 = (print " ") in 
  let val y_2344_3568_4692 = (internal_print_BlogId x_2337_3558_4682) in 
  let val wildcard_2356_3569_4693 = (print " ") in 
  let val y_2345_3570_4694 = (internal_print_BlogAuthor x_2338_3559_4683) in 
  let val wildcard_2355_3571_4695 = (print " ") in 
  let val y_2346_3572_4696 = (internal_print_BlogDate x_2339_3560_4684) in 
  let val wildcard_2354_3573_4697 = (print " ") in 
  let val y_2347_3574_4698 = (internal_print_BlogContent x_2340_3561_4685) in 
  let val wildcard_2353_3575_4699 = (print " ") in 
  let val y_2348_3576_4700 = (internal_print_Blog x_2341_3562_4686) in 
  let val wildcard_2352_3577_4701 = (print " ") in 
  let val y_2349_3578_4702 = (internal_print_BlogTags x_2342_3563_4687) in 
  let val wildcard_2351_3579_4703 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout7 (x_2359_3580_4704 , x_2360_3581_4705, x_2361_3582_4706, x_2362_3583_4707, x_2363_3584_4708, x_2364_3585_4709, x_2365_3586_4710) => 
  let val wildcard_2373_3587_4711 = (print "(Layout7") in 
  let val wildcard_2381_3588_4712 = (print " ") in 
  let val y_2366_3589_4713 = (internal_print_Blog x_2359_3580_4704) in 
  let val wildcard_2380_3590_4714 = (print " ") in 
  let val y_2367_3591_4715 = (internal_print_BlogContent x_2360_3581_4705) in 
  let val wildcard_2379_3592_4716 = (print " ") in 
  let val y_2368_3593_4717 = (internal_print_BlogHeader x_2361_3582_4706) in 
  let val wildcard_2378_3594_4718 = (print " ") in 
  let val y_2369_3595_4719 = (internal_print_BlogId x_2362_3583_4707) in 
  let val wildcard_2377_3596_4720 = (print " ") in 
  let val y_2370_3597_4721 = (internal_print_BlogAuthor x_2363_3584_4708) in 
  let val wildcard_2376_3598_4722 = (print " ") in 
  let val y_2371_3599_4723 = (internal_print_BlogDate x_2364_3585_4709) in 
  let val wildcard_2375_3600_4724 = (print " ") in 
  let val y_2372_3601_4725 = (internal_print_BlogTags x_2365_3586_4710) in 
  let val wildcard_2374_3602_4726 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout8 (x_2382_3603_4727 , x_2383_3604_4728, x_2384_3605_4729, x_2385_3606_4730, x_2386_3607_4731, x_2387_3608_4732, x_2388_3609_4733) => 
  let val wildcard_2396_3610_4734 = (print "(Layout8") in 
  let val wildcard_2404_3611_4735 = (print " ") in 
  let val y_2389_3612_4736 = (internal_print_BlogContent x_2382_3603_4727) in 
  let val wildcard_2403_3613_4737 = (print " ") in 
  let val y_2390_3614_4738 = (internal_print_Blog x_2383_3604_4728) in 
  let val wildcard_2402_3615_4739 = (print " ") in 
  let val y_2391_3616_4740 = (internal_print_BlogId x_2384_3605_4729) in 
  let val wildcard_2401_3617_4741 = (print " ") in 
  let val y_2392_3618_4742 = (internal_print_BlogAuthor x_2385_3606_4730) in 
  let val wildcard_2400_3619_4743 = (print " ") in 
  let val y_2393_3620_4744 = (internal_print_BlogDate x_2386_3607_4731) in 
  let val wildcard_2399_3621_4745 = (print " ") in 
  let val y_2394_3622_4746 = (internal_print_BlogHeader x_2387_3608_4732) in 
  let val wildcard_2398_3623_4747 = (print " ") in 
  let val y_2395_3624_4748 = (internal_print_BlogTags x_2388_3609_4733) in 
  let val wildcard_2397_3625_4749 = (print ")") in () end end end end end end end end end end end end end end end end);

fun internal_print_PList_v_1075 (arg_2472_3692_4816) = (case arg_2472_3692_4816 of Nil_v_1075 => 
  let val wildcard_2473_3693_4817 = (print "(Nil_v_1075") in 
  let val wildcard_2474_3694_4818 = (print ")") in () end end 
  | Cons_v_1075 (x_2475_3695_4819 , x_2476_3696_4820) => 
  let val wildcard_2479_3697_4821 = (print "(Cons_v_1075") in 
  let val wildcard_2482_3698_4822 = (print " ") in 
  let val y_2477_3699_4823 = (internal_print_Block x_2475_3695_4819) in 
  let val wildcard_2481_3700_4824 = (print " ") in 
  let val y_2478_3701_4825 = (internal_print_PList_v_1075 x_2476_3696_4820) in 
  let val wildcard_2480_3702_4826 = (print ")") in () end end end end end end);

fun internal_traverse_Inline (arg_1754_2980_4104) = (case arg_1754_2980_4104 of Str (x_1755_2981_4105) => () 
  | Emph (x_1757_2982_4106) => 
  let val y_1758_2983_4107 = (internal_traverse_PList_v_1072 x_1757_2982_4106) in () end
  | Space => ())
and internal_traverse_PList_v_1072 (arg_2441_3661_4785) = (case arg_2441_3661_4785 of Nil_v_1072 => () 
  | Cons_v_1072 (x_2442_3662_4786 , x_2443_3663_4787) => 
  let val y_2444_3664_4788 = (internal_traverse_Inline x_2442_3662_4786) in 
  let val y_2445_3665_4789 = (internal_traverse_PList_v_1072 x_2443_3663_4787) in () end end);

fun internal_traverse_Block (arg_1778_3003_4127) = (case arg_1778_3003_4127 of Plain (x_1779_3004_4128) => 
  let val y_1780_3005_4129 = (internal_traverse_PList_v_1072 x_1779_3004_4128) in () end 
  | Null => ());

fun internal_traverse_BlogContent (arg_1855_3076_4200) = (case arg_1855_3076_4200 of Content (x_1856_3077_4201) => 
  let val y_1857_3078_4202 = (internal_traverse_Block x_1856_3077_4201) in () end);

fun internal_traverse_Blog (arg_2105_3326_4450) = (case arg_2105_3326_4450 of End => () 
  | Layout1 (x_2106_3327_4451 , x_2107_3328_4452, x_2108_3329_4453, x_2109_3330_4454, x_2110_3331_4455, x_2111_3332_4456, x_2112_3333_4457) => 
  let val y_2113_3334_4458 = (internal_traverse_BlogHeader x_2106_3327_4451) in 
  let val y_2114_3335_4459 = (internal_traverse_BlogId x_2107_3328_4452) in 
  let val y_2115_3336_4460 = (internal_traverse_BlogAuthor x_2108_3329_4453) in 
  let val y_2116_3337_4461 = (internal_traverse_BlogDate x_2109_3330_4454) in 
  let val y_2117_3338_4462 = (internal_traverse_BlogContent x_2110_3331_4455) in 
  let val y_2118_3339_4463 = (internal_traverse_BlogTags x_2111_3332_4456) in 
  let val y_2119_3340_4464 = (internal_traverse_Blog x_2112_3333_4457) in () end end end end end end end
  | Layout2 (x_2120_3341_4465 , x_2121_3342_4466, x_2122_3343_4467, x_2123_3344_4468, x_2124_3345_4469, x_2125_3346_4470, x_2126_3347_4471) => 
  let val y_2127_3348_4472 = (internal_traverse_BlogContent x_2120_3341_4465) in 
  let val y_2128_3349_4473 = (internal_traverse_BlogTags x_2121_3342_4466) in 
  let val y_2129_3350_4474 = (internal_traverse_Blog x_2122_3343_4467) in 
  let val y_2130_3351_4475 = (internal_traverse_BlogHeader x_2123_3344_4468) in 
  let val y_2131_3352_4476 = (internal_traverse_BlogId x_2124_3345_4469) in 
  let val y_2132_3353_4477 = (internal_traverse_BlogAuthor x_2125_3346_4470) in 
  let val y_2133_3354_4478 = (internal_traverse_BlogDate x_2126_3347_4471) in () end end end end end end end
  | Layout3 (x_2134_3355_4479 , x_2135_3356_4480, x_2136_3357_4481, x_2137_3358_4482, x_2138_3359_4483, x_2139_3360_4484, x_2140_3361_4485) => 
  let val y_2141_3362_4486 = (internal_traverse_BlogTags x_2134_3355_4479) in 
  let val y_2142_3363_4487 = (internal_traverse_Blog x_2135_3356_4480) in 
  let val y_2143_3364_4488 = (internal_traverse_BlogContent x_2136_3357_4481) in 
  let val y_2144_3365_4489 = (internal_traverse_BlogHeader x_2137_3358_4482) in 
  let val y_2145_3366_4490 = (internal_traverse_BlogId x_2138_3359_4483) in 
  let val y_2146_3367_4491 = (internal_traverse_BlogAuthor x_2139_3360_4484) in 
  let val y_2147_3368_4492 = (internal_traverse_BlogDate x_2140_3361_4485) in () end end end end end end end
  | Layout4 (x_2148_3369_4493 , x_2149_3370_4494, x_2150_3371_4495, x_2151_3372_4496, x_2152_3373_4497, x_2153_3374_4498, x_2154_3375_4499) => 
  let val y_2155_3376_4500 = (internal_traverse_BlogTags x_2148_3369_4493) in 
  let val y_2156_3377_4501 = (internal_traverse_BlogContent x_2149_3370_4494) in 
  let val y_2157_3378_4502 = (internal_traverse_Blog x_2150_3371_4495) in 
  let val y_2158_3379_4503 = (internal_traverse_BlogHeader x_2151_3372_4496) in 
  let val y_2159_3380_4504 = (internal_traverse_BlogId x_2152_3373_4497) in 
  let val y_2160_3381_4505 = (internal_traverse_BlogAuthor x_2153_3374_4498) in 
  let val y_2161_3382_4506 = (internal_traverse_BlogDate x_2154_3375_4499) in () end end end end end end end
  | Layout5 (x_2162_3383_4507 , x_2163_3384_4508, x_2164_3385_4509, x_2165_3386_4510, x_2166_3387_4511, x_2167_3388_4512, x_2168_3389_4513) => 
  let val y_2169_3390_4514 = (internal_traverse_Blog x_2162_3383_4507) in 
  let val y_2170_3391_4515 = (internal_traverse_BlogTags x_2163_3384_4508) in 
  let val y_2171_3392_4516 = (internal_traverse_BlogContent x_2164_3385_4509) in 
  let val y_2172_3393_4517 = (internal_traverse_BlogHeader x_2165_3386_4510) in 
  let val y_2173_3394_4518 = (internal_traverse_BlogId x_2166_3387_4511) in 
  let val y_2174_3395_4519 = (internal_traverse_BlogAuthor x_2167_3388_4512) in 
  let val y_2175_3396_4520 = (internal_traverse_BlogDate x_2168_3389_4513) in () end end end end end end end
  | Layout6 (x_2176_3397_4521 , x_2177_3398_4522, x_2178_3399_4523, x_2179_3400_4524, x_2180_3401_4525, x_2181_3402_4526, x_2182_3403_4527) => 
  let val y_2183_3404_4528 = (internal_traverse_BlogHeader x_2176_3397_4521) in 
  let val y_2184_3405_4529 = (internal_traverse_BlogId x_2177_3398_4522) in 
  let val y_2185_3406_4530 = (internal_traverse_BlogAuthor x_2178_3399_4523) in 
  let val y_2186_3407_4531 = (internal_traverse_BlogDate x_2179_3400_4524) in 
  let val y_2187_3408_4532 = (internal_traverse_BlogContent x_2180_3401_4525) in 
  let val y_2188_3409_4533 = (internal_traverse_Blog x_2181_3402_4526) in 
  let val y_2189_3410_4534 = (internal_traverse_BlogTags x_2182_3403_4527) in () end end end end end end end
  | Layout7 (x_2190_3411_4535 , x_2191_3412_4536, x_2192_3413_4537, x_2193_3414_4538, x_2194_3415_4539, x_2195_3416_4540, x_2196_3417_4541) => 
  let val y_2197_3418_4542 = (internal_traverse_Blog x_2190_3411_4535) in 
  let val y_2198_3419_4543 = (internal_traverse_BlogContent x_2191_3412_4536) in 
  let val y_2199_3420_4544 = (internal_traverse_BlogHeader x_2192_3413_4537) in 
  let val y_2200_3421_4545 = (internal_traverse_BlogId x_2193_3414_4538) in 
  let val y_2201_3422_4546 = (internal_traverse_BlogAuthor x_2194_3415_4539) in 
  let val y_2202_3423_4547 = (internal_traverse_BlogDate x_2195_3416_4540) in 
  let val y_2203_3424_4548 = (internal_traverse_BlogTags x_2196_3417_4541) in () end end end end end end end
  | Layout8 (x_2204_3425_4549 , x_2205_3426_4550, x_2206_3427_4551, x_2207_3428_4552, x_2208_3429_4553, x_2209_3430_4554, x_2210_3431_4555) => 
  let val y_2211_3432_4556 = (internal_traverse_BlogContent x_2204_3425_4549) in 
  let val y_2212_3433_4557 = (internal_traverse_Blog x_2205_3426_4550) in 
  let val y_2213_3434_4558 = (internal_traverse_BlogId x_2206_3427_4551) in 
  let val y_2214_3435_4559 = (internal_traverse_BlogAuthor x_2207_3428_4552) in 
  let val y_2215_3436_4560 = (internal_traverse_BlogDate x_2208_3429_4553) in 
  let val y_2216_3437_4561 = (internal_traverse_BlogHeader x_2209_3430_4554) in 
  let val y_2217_3438_4562 = (internal_traverse_BlogTags x_2210_3431_4555) in () end end end end end end end);

fun internal_traverse_PList_v_1075 (arg_2467_3687_4811) = (case arg_2467_3687_4811 of Nil_v_1075 => () 
  | Cons_v_1075 (x_2468_3688_4812 , x_2469_3689_4813) => 
  let val y_2470_3690_4814 = (internal_traverse_Block x_2468_3688_4812) in 
  let val y_2471_3691_4815 = (internal_traverse_PList_v_1075 x_2469_3689_4813) in () end end);

fun internal_copy_without_ptrs_Inline (arg_1749_2975_4099) = (case arg_1749_2975_4099 of Str (x_1750_2976_4100) => (Str (x_1750_2976_4100)) 
  | Emph (x_1752_2978_4102) => 
  let val y_1753_2979_4103 = (internal_copy_without_ptrs_PList_v_1072 x_1752_2978_4102) in (Emph (y_1753_2979_4103)) end
  | Space => Space)
and internal_copy_without_ptrs_PList_v_1072 (arg_2436_3656_4780) = (case arg_2436_3656_4780 of Nil_v_1072 => Nil_v_1072 
  | Cons_v_1072 (x_2437_3657_4781 , x_2438_3658_4782) => 
  let val y_2439_3659_4783 = (internal_copy_without_ptrs_Inline x_2437_3657_4781) in 
  let val y_2440_3660_4784 = (internal_copy_without_ptrs_PList_v_1072 x_2438_3658_4782) in (Cons_v_1072 (y_2439_3659_4783 , y_2440_3660_4784)) end end);

fun internal_copy_without_ptrs_Block (arg_1775_3000_4124) = (case arg_1775_3000_4124 of Plain (x_1776_3001_4125) => 
  let val y_1777_3002_4126 = (internal_copy_without_ptrs_PList_v_1072 x_1776_3001_4125) in (Plain (y_1777_3002_4126)) end 
  | Null => Null);

fun internal_copy_without_ptrs_BlogContent (arg_1852_3073_4197) = (case arg_1852_3073_4197 of Content (x_1853_3074_4198) => 
  let val y_1854_3075_4199 = (internal_copy_without_ptrs_Block x_1853_3074_4198) in (Content (y_1854_3075_4199)) end);

fun internal_copy_without_ptrs_Blog (arg_1992_3213_4337) = (case arg_1992_3213_4337 of End => End 
  | Layout1 (x_1993_3214_4338 , x_1994_3215_4339, x_1995_3216_4340, x_1996_3217_4341, x_1997_3218_4342, x_1998_3219_4343, x_1999_3220_4344) => 
  let val y_2000_3221_4345 = (internal_copy_without_ptrs_BlogHeader x_1993_3214_4338) in 
  let val y_2001_3222_4346 = (internal_copy_without_ptrs_BlogId x_1994_3215_4339) in 
  let val y_2002_3223_4347 = (internal_copy_without_ptrs_BlogAuthor x_1995_3216_4340) in 
  let val y_2003_3224_4348 = (internal_copy_without_ptrs_BlogDate x_1996_3217_4341) in 
  let val y_2004_3225_4349 = (internal_copy_without_ptrs_BlogContent x_1997_3218_4342) in 
  let val y_2005_3226_4350 = (internal_copy_without_ptrs_BlogTags x_1998_3219_4343) in 
  let val y_2006_3227_4351 = (internal_copy_without_ptrs_Blog x_1999_3220_4344) in (Layout1 (y_2000_3221_4345 , y_2001_3222_4346, y_2002_3223_4347, y_2003_3224_4348, y_2004_3225_4349, y_2005_3226_4350, y_2006_3227_4351)) end end end end end end end
  | Layout2 (x_2007_3228_4352 , x_2008_3229_4353, x_2009_3230_4354, x_2010_3231_4355, x_2011_3232_4356, x_2012_3233_4357, x_2013_3234_4358) => 
  let val y_2014_3235_4359 = (internal_copy_without_ptrs_BlogContent x_2007_3228_4352) in 
  let val y_2015_3236_4360 = (internal_copy_without_ptrs_BlogTags x_2008_3229_4353) in 
  let val y_2016_3237_4361 = (internal_copy_without_ptrs_Blog x_2009_3230_4354) in 
  let val y_2017_3238_4362 = (internal_copy_without_ptrs_BlogHeader x_2010_3231_4355) in 
  let val y_2018_3239_4363 = (internal_copy_without_ptrs_BlogId x_2011_3232_4356) in 
  let val y_2019_3240_4364 = (internal_copy_without_ptrs_BlogAuthor x_2012_3233_4357) in 
  let val y_2020_3241_4365 = (internal_copy_without_ptrs_BlogDate x_2013_3234_4358) in (Layout2 (y_2014_3235_4359 , y_2015_3236_4360, y_2016_3237_4361, y_2017_3238_4362, y_2018_3239_4363, y_2019_3240_4364, y_2020_3241_4365)) end end end end end end end
  | Layout3 (x_2021_3242_4366 , x_2022_3243_4367, x_2023_3244_4368, x_2024_3245_4369, x_2025_3246_4370, x_2026_3247_4371, x_2027_3248_4372) => 
  let val y_2028_3249_4373 = (internal_copy_without_ptrs_BlogTags x_2021_3242_4366) in 
  let val y_2029_3250_4374 = (internal_copy_without_ptrs_Blog x_2022_3243_4367) in 
  let val y_2030_3251_4375 = (internal_copy_without_ptrs_BlogContent x_2023_3244_4368) in 
  let val y_2031_3252_4376 = (internal_copy_without_ptrs_BlogHeader x_2024_3245_4369) in 
  let val y_2032_3253_4377 = (internal_copy_without_ptrs_BlogId x_2025_3246_4370) in 
  let val y_2033_3254_4378 = (internal_copy_without_ptrs_BlogAuthor x_2026_3247_4371) in 
  let val y_2034_3255_4379 = (internal_copy_without_ptrs_BlogDate x_2027_3248_4372) in (Layout3 (y_2028_3249_4373 , y_2029_3250_4374, y_2030_3251_4375, y_2031_3252_4376, y_2032_3253_4377, y_2033_3254_4378, y_2034_3255_4379)) end end end end end end end
  | Layout4 (x_2035_3256_4380 , x_2036_3257_4381, x_2037_3258_4382, x_2038_3259_4383, x_2039_3260_4384, x_2040_3261_4385, x_2041_3262_4386) => 
  let val y_2042_3263_4387 = (internal_copy_without_ptrs_BlogTags x_2035_3256_4380) in 
  let val y_2043_3264_4388 = (internal_copy_without_ptrs_BlogContent x_2036_3257_4381) in 
  let val y_2044_3265_4389 = (internal_copy_without_ptrs_Blog x_2037_3258_4382) in 
  let val y_2045_3266_4390 = (internal_copy_without_ptrs_BlogHeader x_2038_3259_4383) in 
  let val y_2046_3267_4391 = (internal_copy_without_ptrs_BlogId x_2039_3260_4384) in 
  let val y_2047_3268_4392 = (internal_copy_without_ptrs_BlogAuthor x_2040_3261_4385) in 
  let val y_2048_3269_4393 = (internal_copy_without_ptrs_BlogDate x_2041_3262_4386) in (Layout4 (y_2042_3263_4387 , y_2043_3264_4388, y_2044_3265_4389, y_2045_3266_4390, y_2046_3267_4391, y_2047_3268_4392, y_2048_3269_4393)) end end end end end end end
  | Layout5 (x_2049_3270_4394 , x_2050_3271_4395, x_2051_3272_4396, x_2052_3273_4397, x_2053_3274_4398, x_2054_3275_4399, x_2055_3276_4400) => 
  let val y_2056_3277_4401 = (internal_copy_without_ptrs_Blog x_2049_3270_4394) in 
  let val y_2057_3278_4402 = (internal_copy_without_ptrs_BlogTags x_2050_3271_4395) in 
  let val y_2058_3279_4403 = (internal_copy_without_ptrs_BlogContent x_2051_3272_4396) in 
  let val y_2059_3280_4404 = (internal_copy_without_ptrs_BlogHeader x_2052_3273_4397) in 
  let val y_2060_3281_4405 = (internal_copy_without_ptrs_BlogId x_2053_3274_4398) in 
  let val y_2061_3282_4406 = (internal_copy_without_ptrs_BlogAuthor x_2054_3275_4399) in 
  let val y_2062_3283_4407 = (internal_copy_without_ptrs_BlogDate x_2055_3276_4400) in (Layout5 (y_2056_3277_4401 , y_2057_3278_4402, y_2058_3279_4403, y_2059_3280_4404, y_2060_3281_4405, y_2061_3282_4406, y_2062_3283_4407)) end end end end end end end
  | Layout6 (x_2063_3284_4408 , x_2064_3285_4409, x_2065_3286_4410, x_2066_3287_4411, x_2067_3288_4412, x_2068_3289_4413, x_2069_3290_4414) => 
  let val y_2070_3291_4415 = (internal_copy_without_ptrs_BlogHeader x_2063_3284_4408) in 
  let val y_2071_3292_4416 = (internal_copy_without_ptrs_BlogId x_2064_3285_4409) in 
  let val y_2072_3293_4417 = (internal_copy_without_ptrs_BlogAuthor x_2065_3286_4410) in 
  let val y_2073_3294_4418 = (internal_copy_without_ptrs_BlogDate x_2066_3287_4411) in 
  let val y_2074_3295_4419 = (internal_copy_without_ptrs_BlogContent x_2067_3288_4412) in 
  let val y_2075_3296_4420 = (internal_copy_without_ptrs_Blog x_2068_3289_4413) in 
  let val y_2076_3297_4421 = (internal_copy_without_ptrs_BlogTags x_2069_3290_4414) in (Layout6 (y_2070_3291_4415 , y_2071_3292_4416, y_2072_3293_4417, y_2073_3294_4418, y_2074_3295_4419, y_2075_3296_4420, y_2076_3297_4421)) end end end end end end end
  | Layout7 (x_2077_3298_4422 , x_2078_3299_4423, x_2079_3300_4424, x_2080_3301_4425, x_2081_3302_4426, x_2082_3303_4427, x_2083_3304_4428) => 
  let val y_2084_3305_4429 = (internal_copy_without_ptrs_Blog x_2077_3298_4422) in 
  let val y_2085_3306_4430 = (internal_copy_without_ptrs_BlogContent x_2078_3299_4423) in 
  let val y_2086_3307_4431 = (internal_copy_without_ptrs_BlogHeader x_2079_3300_4424) in 
  let val y_2087_3308_4432 = (internal_copy_without_ptrs_BlogId x_2080_3301_4425) in 
  let val y_2088_3309_4433 = (internal_copy_without_ptrs_BlogAuthor x_2081_3302_4426) in 
  let val y_2089_3310_4434 = (internal_copy_without_ptrs_BlogDate x_2082_3303_4427) in 
  let val y_2090_3311_4435 = (internal_copy_without_ptrs_BlogTags x_2083_3304_4428) in (Layout7 (y_2084_3305_4429 , y_2085_3306_4430, y_2086_3307_4431, y_2087_3308_4432, y_2088_3309_4433, y_2089_3310_4434, y_2090_3311_4435)) end end end end end end end
  | Layout8 (x_2091_3312_4436 , x_2092_3313_4437, x_2093_3314_4438, x_2094_3315_4439, x_2095_3316_4440, x_2096_3317_4441, x_2097_3318_4442) => 
  let val y_2098_3319_4443 = (internal_copy_without_ptrs_BlogContent x_2091_3312_4436) in 
  let val y_2099_3320_4444 = (internal_copy_without_ptrs_Blog x_2092_3313_4437) in 
  let val y_2100_3321_4445 = (internal_copy_without_ptrs_BlogId x_2093_3314_4438) in 
  let val y_2101_3322_4446 = (internal_copy_without_ptrs_BlogAuthor x_2094_3315_4439) in 
  let val y_2102_3323_4447 = (internal_copy_without_ptrs_BlogDate x_2095_3316_4440) in 
  let val y_2103_3324_4448 = (internal_copy_without_ptrs_BlogHeader x_2096_3317_4441) in 
  let val y_2104_3325_4449 = (internal_copy_without_ptrs_BlogTags x_2097_3318_4442) in (Layout8 (y_2098_3319_4443 , y_2099_3320_4444, y_2100_3321_4445, y_2101_3322_4446, y_2102_3323_4447, y_2103_3324_4448, y_2104_3325_4449)) end end end end end end end);

fun internal_copy_without_ptrs_PList_v_1075 (arg_2462_3682_4806) = (case arg_2462_3682_4806 of Nil_v_1075 => Nil_v_1075 
  | Cons_v_1075 (x_2463_3683_4807 , x_2464_3684_4808) => 
  let val y_2465_3685_4809 = (internal_copy_without_ptrs_Block x_2463_3683_4807) in 
  let val y_2466_3686_4810 = (internal_copy_without_ptrs_PList_v_1075 x_2464_3684_4808) in (Cons_v_1075 (y_2465_3685_4809 , y_2466_3686_4810)) end end);

fun internal_copy_Inline (arg_1744_2970_4094) = (case arg_1744_2970_4094 of Str (x_1745_2971_4095) => (Str (x_1745_2971_4095)) 
  | Emph (x_1747_2973_4097) => 
  let val y_1748_2974_4098 = (internal_copy_PList_v_1072 x_1747_2973_4097) in (Emph (y_1748_2974_4098)) end
  | Space => Space)
and internal_copy_PList_v_1072 (arg_2431_3651_4775) = (case arg_2431_3651_4775 of Nil_v_1072 => Nil_v_1072 
  | Cons_v_1072 (x_2432_3652_4776 , x_2433_3653_4777) => 
  let val y_2434_3654_4778 = (internal_copy_Inline x_2432_3652_4776) in 
  let val y_2435_3655_4779 = (internal_copy_PList_v_1072 x_2433_3653_4777) in (Cons_v_1072 (y_2434_3654_4778 , y_2435_3655_4779)) end end);

fun internal_copy_Block (arg_1772_2997_4121) = (case arg_1772_2997_4121 of Plain (x_1773_2998_4122) => 
  let val y_1774_2999_4123 = (internal_copy_PList_v_1072 x_1773_2998_4122) in (Plain (y_1774_2999_4123)) end 
  | Null => Null);

fun internal_copy_BlogContent (arg_1849_3070_4194) = (case arg_1849_3070_4194 of Content (x_1850_3071_4195) => 
  let val y_1851_3072_4196 = (internal_copy_Block x_1850_3071_4195) in (Content (y_1851_3072_4196)) end);

fun internal_copy_Blog (arg_1879_3100_4224) = (case arg_1879_3100_4224 of End => End 
  | Layout1 (x_1880_3101_4225 , x_1881_3102_4226, x_1882_3103_4227, x_1883_3104_4228, x_1884_3105_4229, x_1885_3106_4230, x_1886_3107_4231) => 
  let val y_1887_3108_4232 = (internal_copy_BlogHeader x_1880_3101_4225) in 
  let val y_1888_3109_4233 = (internal_copy_BlogId x_1881_3102_4226) in 
  let val y_1889_3110_4234 = (internal_copy_BlogAuthor x_1882_3103_4227) in 
  let val y_1890_3111_4235 = (internal_copy_BlogDate x_1883_3104_4228) in 
  let val y_1891_3112_4236 = (internal_copy_BlogContent x_1884_3105_4229) in 
  let val y_1892_3113_4237 = (internal_copy_BlogTags x_1885_3106_4230) in 
  let val y_1893_3114_4238 = (internal_copy_Blog x_1886_3107_4231) in (Layout1 (y_1887_3108_4232 , y_1888_3109_4233, y_1889_3110_4234, y_1890_3111_4235, y_1891_3112_4236, y_1892_3113_4237, y_1893_3114_4238)) end end end end end end end
  | Layout2 (x_1894_3115_4239 , x_1895_3116_4240, x_1896_3117_4241, x_1897_3118_4242, x_1898_3119_4243, x_1899_3120_4244, x_1900_3121_4245) => 
  let val y_1901_3122_4246 = (internal_copy_BlogContent x_1894_3115_4239) in 
  let val y_1902_3123_4247 = (internal_copy_BlogTags x_1895_3116_4240) in 
  let val y_1903_3124_4248 = (internal_copy_Blog x_1896_3117_4241) in 
  let val y_1904_3125_4249 = (internal_copy_BlogHeader x_1897_3118_4242) in 
  let val y_1905_3126_4250 = (internal_copy_BlogId x_1898_3119_4243) in 
  let val y_1906_3127_4251 = (internal_copy_BlogAuthor x_1899_3120_4244) in 
  let val y_1907_3128_4252 = (internal_copy_BlogDate x_1900_3121_4245) in (Layout2 (y_1901_3122_4246 , y_1902_3123_4247, y_1903_3124_4248, y_1904_3125_4249, y_1905_3126_4250, y_1906_3127_4251, y_1907_3128_4252)) end end end end end end end
  | Layout3 (x_1908_3129_4253 , x_1909_3130_4254, x_1910_3131_4255, x_1911_3132_4256, x_1912_3133_4257, x_1913_3134_4258, x_1914_3135_4259) => 
  let val y_1915_3136_4260 = (internal_copy_BlogTags x_1908_3129_4253) in 
  let val y_1916_3137_4261 = (internal_copy_Blog x_1909_3130_4254) in 
  let val y_1917_3138_4262 = (internal_copy_BlogContent x_1910_3131_4255) in 
  let val y_1918_3139_4263 = (internal_copy_BlogHeader x_1911_3132_4256) in 
  let val y_1919_3140_4264 = (internal_copy_BlogId x_1912_3133_4257) in 
  let val y_1920_3141_4265 = (internal_copy_BlogAuthor x_1913_3134_4258) in 
  let val y_1921_3142_4266 = (internal_copy_BlogDate x_1914_3135_4259) in (Layout3 (y_1915_3136_4260 , y_1916_3137_4261, y_1917_3138_4262, y_1918_3139_4263, y_1919_3140_4264, y_1920_3141_4265, y_1921_3142_4266)) end end end end end end end
  | Layout4 (x_1922_3143_4267 , x_1923_3144_4268, x_1924_3145_4269, x_1925_3146_4270, x_1926_3147_4271, x_1927_3148_4272, x_1928_3149_4273) => 
  let val y_1929_3150_4274 = (internal_copy_BlogTags x_1922_3143_4267) in 
  let val y_1930_3151_4275 = (internal_copy_BlogContent x_1923_3144_4268) in 
  let val y_1931_3152_4276 = (internal_copy_Blog x_1924_3145_4269) in 
  let val y_1932_3153_4277 = (internal_copy_BlogHeader x_1925_3146_4270) in 
  let val y_1933_3154_4278 = (internal_copy_BlogId x_1926_3147_4271) in 
  let val y_1934_3155_4279 = (internal_copy_BlogAuthor x_1927_3148_4272) in 
  let val y_1935_3156_4280 = (internal_copy_BlogDate x_1928_3149_4273) in (Layout4 (y_1929_3150_4274 , y_1930_3151_4275, y_1931_3152_4276, y_1932_3153_4277, y_1933_3154_4278, y_1934_3155_4279, y_1935_3156_4280)) end end end end end end end
  | Layout5 (x_1936_3157_4281 , x_1937_3158_4282, x_1938_3159_4283, x_1939_3160_4284, x_1940_3161_4285, x_1941_3162_4286, x_1942_3163_4287) => 
  let val y_1943_3164_4288 = (internal_copy_Blog x_1936_3157_4281) in 
  let val y_1944_3165_4289 = (internal_copy_BlogTags x_1937_3158_4282) in 
  let val y_1945_3166_4290 = (internal_copy_BlogContent x_1938_3159_4283) in 
  let val y_1946_3167_4291 = (internal_copy_BlogHeader x_1939_3160_4284) in 
  let val y_1947_3168_4292 = (internal_copy_BlogId x_1940_3161_4285) in 
  let val y_1948_3169_4293 = (internal_copy_BlogAuthor x_1941_3162_4286) in 
  let val y_1949_3170_4294 = (internal_copy_BlogDate x_1942_3163_4287) in (Layout5 (y_1943_3164_4288 , y_1944_3165_4289, y_1945_3166_4290, y_1946_3167_4291, y_1947_3168_4292, y_1948_3169_4293, y_1949_3170_4294)) end end end end end end end
  | Layout6 (x_1950_3171_4295 , x_1951_3172_4296, x_1952_3173_4297, x_1953_3174_4298, x_1954_3175_4299, x_1955_3176_4300, x_1956_3177_4301) => 
  let val y_1957_3178_4302 = (internal_copy_BlogHeader x_1950_3171_4295) in 
  let val y_1958_3179_4303 = (internal_copy_BlogId x_1951_3172_4296) in 
  let val y_1959_3180_4304 = (internal_copy_BlogAuthor x_1952_3173_4297) in 
  let val y_1960_3181_4305 = (internal_copy_BlogDate x_1953_3174_4298) in 
  let val y_1961_3182_4306 = (internal_copy_BlogContent x_1954_3175_4299) in 
  let val y_1962_3183_4307 = (internal_copy_Blog x_1955_3176_4300) in 
  let val y_1963_3184_4308 = (internal_copy_BlogTags x_1956_3177_4301) in (Layout6 (y_1957_3178_4302 , y_1958_3179_4303, y_1959_3180_4304, y_1960_3181_4305, y_1961_3182_4306, y_1962_3183_4307, y_1963_3184_4308)) end end end end end end end
  | Layout7 (x_1964_3185_4309 , x_1965_3186_4310, x_1966_3187_4311, x_1967_3188_4312, x_1968_3189_4313, x_1969_3190_4314, x_1970_3191_4315) => 
  let val y_1971_3192_4316 = (internal_copy_Blog x_1964_3185_4309) in 
  let val y_1972_3193_4317 = (internal_copy_BlogContent x_1965_3186_4310) in 
  let val y_1973_3194_4318 = (internal_copy_BlogHeader x_1966_3187_4311) in 
  let val y_1974_3195_4319 = (internal_copy_BlogId x_1967_3188_4312) in 
  let val y_1975_3196_4320 = (internal_copy_BlogAuthor x_1968_3189_4313) in 
  let val y_1976_3197_4321 = (internal_copy_BlogDate x_1969_3190_4314) in 
  let val y_1977_3198_4322 = (internal_copy_BlogTags x_1970_3191_4315) in (Layout7 (y_1971_3192_4316 , y_1972_3193_4317, y_1973_3194_4318, y_1974_3195_4319, y_1975_3196_4320, y_1976_3197_4321, y_1977_3198_4322)) end end end end end end end
  | Layout8 (x_1978_3199_4323 , x_1979_3200_4324, x_1980_3201_4325, x_1981_3202_4326, x_1982_3203_4327, x_1983_3204_4328, x_1984_3205_4329) => 
  let val y_1985_3206_4330 = (internal_copy_BlogContent x_1978_3199_4323) in 
  let val y_1986_3207_4331 = (internal_copy_Blog x_1979_3200_4324) in 
  let val y_1987_3208_4332 = (internal_copy_BlogId x_1980_3201_4325) in 
  let val y_1988_3209_4333 = (internal_copy_BlogAuthor x_1981_3202_4326) in 
  let val y_1989_3210_4334 = (internal_copy_BlogDate x_1982_3203_4327) in 
  let val y_1990_3211_4335 = (internal_copy_BlogHeader x_1983_3204_4328) in 
  let val y_1991_3212_4336 = (internal_copy_BlogTags x_1984_3205_4329) in (Layout8 (y_1985_3206_4330 , y_1986_3207_4331, y_1987_3208_4332, y_1988_3209_4333, y_1989_3210_4334, y_1990_3211_4335, y_1991_3212_4336)) end end end end end end end);

fun internal_copy_PList_v_1075 (arg_2457_3677_4801) = (case arg_2457_3677_4801 of Nil_v_1075 => Nil_v_1075 
  | Cons_v_1075 (x_2458_3678_4802 , x_2459_3679_4803) => 
  let val y_2460_3680_4804 = (internal_copy_Block x_2458_3678_4802) in 
  let val y_2461_3681_4805 = (internal_copy_PList_v_1075 x_2459_3679_4803) in (Cons_v_1075 (y_2460_3680_4804 , y_2461_3681_4805)) end end);

fun maxInt (a_398_2803_4084 , b_399_2804_4085) = 
  let val fltIf_3876_4086 = (a_398_2803_4084 > b_399_2804_4085) in 
  (if fltIf_3876_4086 then a_398_2803_4084 
   else b_399_2804_4085) end;

fun cmp (start_318_2755_4053 , end_319_2756_4054, word1_320_2757_4055, word2_321_2758_4056) = 
  let val fltIf_3870_4057 = (start_318_2755_4053 < end_319_2756_4054) in 
  (if fltIf_3870_4057 then 
  let val a_322_2759_4060 = (CharArraySlice.sub(word1_320_2757_4055 , start_318_2755_4053)) in 
  let val b_323_2760_4063 = (CharArraySlice.sub(word2_321_2758_4056 , start_318_2755_4053)) in 
  let val fltIf_3871_4064 = (a_322_2759_4060 = b_323_2760_4063) in 
  let val eq_324_2761_4065 = 
  (if fltIf_3871_4064 then true 
   else false) in 
  let val fltAppE_3872_4066 = (start_318_2755_4053 + 1) in 
  let val recurse_325_2762_4067 = (cmp(fltAppE_3872_4066 , end_319_2756_4054, word1_320_2757_4055, word2_321_2758_4056)) in (eq_324_2761_4065 andalso recurse_325_2762_4067) end end end end end end 
   else true) end;

fun compareWord (word1_326_2763_4068 , word2_327_2764_4069) = 
  let val len1_328_2765_4071 = (CharArraySlice.length word1_326_2763_4068) in 
  let val len2_329_2766_4073 = (CharArraySlice.length word2_327_2764_4069) in 
  let val fltIf_3873_4074 = (len1_328_2765_4071 = len2_329_2766_4073) in 
  let val compare_len_330_2767_4075 = 
  (if fltIf_3873_4074 then true 
   else false) in 
  (if compare_len_330_2767_4075 then (cmp(0 , len1_328_2765_4071, word1_326_2763_4068, word2_327_2764_4069)) 
   else false) end end end end;

fun searchTagList (keyword_314_2751_4047 , taglist_315_2752_4048) = (case taglist_315_2752_4048 of Nil_v_1073 => false 
  | Cons_v_1073 (word_316_2753_4049 , rst_317_2754_4050) => 
  let val fltPrm_3868_4051 = (compareWord(keyword_314_2751_4047 , word_316_2753_4049)) in 
  let val fltPrm_3869_4052 = (searchTagList(keyword_314_2751_4047 , rst_317_2754_4050)) in (fltPrm_3868_4051 orelse fltPrm_3869_4052) end end);

fun emphasizeInlineListForKeyword (keyword_279_2716_4032 , inline_list_280_2717_4033) = (case inline_list_280_2717_4033 of Nil_v_1072 => Nil_v_1072 
  | Cons_v_1072 (inline_281_2718_4034 , rst_282_2719_4035) => 
  let val newinline_283_2720_4036 = (emphasizeKeywordInline(keyword_279_2716_4032 , inline_281_2718_4034)) in 
  let val rst__284_2721_4037 = (emphasizeInlineListForKeyword(keyword_279_2716_4032 , rst_282_2719_4035)) in (Cons_v_1072 (newinline_283_2720_4036 , rst__284_2721_4037)) end end)
and emphasizeKeywordInline (keyword_285_2722_4038 , inline_286_2723_4039) = (case inline_286_2723_4039 of Str (text_287_2724_4040) => 
  let val isSame_288_2725_4041 = (compareWord(keyword_285_2722_4038 , text_287_2724_4040)) in 
  (if isSame_288_2725_4041 then 
  let val fltPkd_3865_4042 = (internal_copy_Inline inline_286_2723_4039) in 
  let val fltPkd_3866_4043 = Nil_v_1072 in 
  let val newlist_289_2726_4044 = (Cons_v_1072 (fltPkd_3865_4042 , fltPkd_3866_4043)) in (Emph (newlist_289_2726_4044)) end end end 
   else inline_286_2723_4039) end 
  | Emph (list_inline_290_2727_4045) => 
  let val fltPkd_3867_4046 = (emphasizeInlineListForKeyword(keyword_285_2722_4038 , list_inline_290_2727_4045)) in (Emph (fltPkd_3867_4046)) end
  | Space => Space);

fun mkSomeTags (len_196_2653_4019) = 
  let val fltIf_3860_4020 = (len_196_2653_4019 <= 0) in 
  (if fltIf_3860_4020 then Nil_v_1073 
   else 
  let val vec_220_197_2654_4021 = ((fn internal__ => CharArraySlice.full(CharArray.array(internal__, #"0"))) 1) in 
  let val internal__198_2655_4022 = let val _ = (CharArraySlice.update(vec_220_197_2654_4021 , 0, #"a")) in vec_220_197_2654_4021 end in 
  let val fltAppE_3861_4024 = (len_196_2653_4019 - 1) in 
  let val rst_200_2657_4025 = (mkSomeTags fltAppE_3861_4024) in (Cons_v_1073 (vec_220_197_2654_4021 , rst_200_2657_4025)) end end end end) end;

fun getChar (decimal_115_2577_3993) = 
  let val fltIf_3835_3994 = (decimal_115_2577_3993 = 0) in 
  (if fltIf_3835_3994 then #"a" 
   else 
  let val fltIf_3836_3995 = (decimal_115_2577_3993 = 1) in 
  (if fltIf_3836_3995 then #"b" 
   else 
  let val fltIf_3837_3996 = (decimal_115_2577_3993 = 2) in 
  (if fltIf_3837_3996 then #"c" 
   else 
  let val fltIf_3838_3997 = (decimal_115_2577_3993 = 3) in 
  (if fltIf_3838_3997 then #"d" 
   else 
  let val fltIf_3839_3998 = (decimal_115_2577_3993 = 4) in 
  (if fltIf_3839_3998 then #"e" 
   else 
  let val fltIf_3840_3999 = (decimal_115_2577_3993 = 5) in 
  (if fltIf_3840_3999 then #"f" 
   else 
  let val fltIf_3841_4000 = (decimal_115_2577_3993 = 6) in 
  (if fltIf_3841_4000 then #"g" 
   else 
  let val fltIf_3842_4001 = (decimal_115_2577_3993 = 7) in 
  (if fltIf_3842_4001 then #"h" 
   else 
  let val fltIf_3843_4002 = (decimal_115_2577_3993 = 8) in 
  (if fltIf_3843_4002 then #"i" 
   else 
  let val fltIf_3844_4003 = (decimal_115_2577_3993 = 9) in 
  (if fltIf_3844_4003 then #"j" 
   else 
  let val fltIf_3845_4004 = (decimal_115_2577_3993 = 10) in 
  (if fltIf_3845_4004 then #"k" 
   else 
  let val fltIf_3846_4005 = (decimal_115_2577_3993 = 11) in 
  (if fltIf_3846_4005 then #"l" 
   else 
  let val fltIf_3847_4006 = (decimal_115_2577_3993 = 12) in 
  (if fltIf_3847_4006 then #"m" 
   else 
  let val fltIf_3848_4007 = (decimal_115_2577_3993 = 13) in 
  (if fltIf_3848_4007 then #"n" 
   else 
  let val fltIf_3849_4008 = (decimal_115_2577_3993 = 14) in 
  (if fltIf_3849_4008 then #"o" 
   else 
  let val fltIf_3850_4009 = (decimal_115_2577_3993 = 15) in 
  (if fltIf_3850_4009 then #"p" 
   else 
  let val fltIf_3851_4010 = (decimal_115_2577_3993 = 16) in 
  (if fltIf_3851_4010 then #"q" 
   else 
  let val fltIf_3852_4011 = (decimal_115_2577_3993 = 17) in 
  (if fltIf_3852_4011 then #"r" 
   else 
  let val fltIf_3853_4012 = (decimal_115_2577_3993 = 18) in 
  (if fltIf_3853_4012 then #"s" 
   else 
  let val fltIf_3854_4013 = (decimal_115_2577_3993 = 19) in 
  (if fltIf_3854_4013 then #"t" 
   else 
  let val fltIf_3855_4014 = (decimal_115_2577_3993 = 20) in 
  (if fltIf_3855_4014 then #"u" 
   else 
  let val fltIf_3856_4015 = (decimal_115_2577_3993 = 21) in 
  (if fltIf_3856_4015 then #"v" 
   else 
  let val fltIf_3857_4016 = (decimal_115_2577_3993 = 22) in 
  (if fltIf_3857_4016 then #"w" 
   else 
  let val fltIf_3858_4017 = (decimal_115_2577_3993 = 23) in 
  (if fltIf_3858_4017 then #"x" 
   else 
  let val fltIf_3859_4018 = (decimal_115_2577_3993 = 24) in 
  (if fltIf_3859_4018 then #"y" 
   else #"z") end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end;

fun mkChar (val_365_2802_4081) = 
  let val fltPrm_3875_4082 = (Word.toInt (MLton.Random.rand())) in 
  let val fltAppE_3874_4083 = (fltPrm_3875_4082 mod 26) in (getChar fltAppE_3874_4083) end end;

fun generate_loop_1085_1576 (vec_621_2960_4087 , idx_622_2961_4088, end_623_2962_4089) = 
  let val fltIf_3877_4090 = (idx_622_2961_4088 = end_623_2962_4089) in 
  (if fltIf_3877_4090 then vec_621_2960_4087 
   else 
  let val fltPrm_3878_4091 = (mkChar idx_622_2961_4088) in 
  let val vec1_626_2963_4092 = let val _ = (CharArraySlice.update(vec_621_2960_4087 , idx_622_2961_4088, fltPrm_3878_4091)) in vec_621_2960_4087 end in 
  let val fltAppE_3879_4093 = (idx_622_2961_4088 + 1) in (generate_loop_1085_1576(vec1_626_2963_4092 , fltAppE_3879_4093, end_623_2962_4089)) end end end) end;

fun getRandomString (length_359_2782_4042) = 
  let val n__364_2938_3732_4044 = 0 in 
  let val vec_365_2939_3733_4045 = ((fn internal__ =>
  CharArraySlice.full(CharArray.array(internal__, #"0"))) length_359_2782_4042) in 
  let val vec1_366_2940_3734_4046 = (generate_loop_1077_1562(vec_365_2939_3733_4045 , 0, n__364_2938_3732_4044)) in vec1_366_2940_3734_4046 end end end;

fun mkRandomInlineList (len_201_2658_4026) = 
  let val fltIf_3862_4027 = (len_201_2658_4026 <= 0) in 
  (if fltIf_3862_4027 then Nil_v_1072 
   else 
  let val fltPkd_3863_4028 = (getRandomString 5) in 
  let val word_202_2659_4029 = (Str (fltPkd_3863_4028)) in 
  let val fltAppE_3864_4030 = (len_201_2658_4026 - 1) in 
  let val rst_203_2660_4031 = (mkRandomInlineList fltAppE_3864_4030) in (Cons_v_1072 (word_202_2659_4029 , rst_203_2660_4031)) end end end end) end;

fun mkBlogs_layout2 (length_105_2567_3973 , contlen_106_2568_3974, taglen_107_2569_3975) = 
  let val fltIf_3825_3976 = (length_105_2567_3973 <= 0) in 
  (if fltIf_3825_3976 then End 
   else 
  let val fltPkd_3827_3977 = (mkRandomInlineList contlen_106_2568_3974) in 
  let val fltPkd_3826_3978 = (Plain (fltPkd_3827_3977)) in 
  let val content_108_2570_3979 = (Content (fltPkd_3826_3978)) in 
  let val fltPkd_3828_3980 = (mkSomeTags taglen_107_2569_3975) in 
  let val tags_109_2571_3981 = (TagList (fltPkd_3828_3980)) in 
  let val fltAppE_3829_3982 = (length_105_2567_3973 - 1) in 
  let val rst_110_2572_3983 = (mkBlogs_layout2(fltAppE_3829_3982 , contlen_106_2568_3974, taglen_107_2569_3975)) in 
  let val fltPkd_3830_3984 = (getRandomString 5) in 
  let val header_111_2573_3985 = (Header (fltPkd_3830_3984)) in 
  let val fltPrm_3832_3986 = (length_105_2567_3973 mod 10) in 
  let val fltPkd_3831_3987 = (10 - fltPrm_3832_3986) in 
  let val id_112_2574_3988 = (ID (fltPkd_3831_3987)) in 
  let val fltPkd_3833_3989 = (getRandomString 5) in 
  let val author_113_2575_3990 = (Author (fltPkd_3833_3989)) in 
  let val fltPkd_3834_3991 = (getRandomString 5) in 
  let val date_114_2576_3992 = (Date (fltPkd_3834_3991)) in (Layout2 (content_108_2570_3979 , tags_109_2571_3981, rst_110_2572_3983, header_111_2573_3985, id_112_2574_3988, author_113_2575_3990, date_114_2576_3992)) end end end end end end end end end end end end end end end end) end;

fun blogLength (blog_48_2510_3908) = (case blog_48_2510_3908 of End => 0 
  | Layout1 (a_49_2511_3909 , b_50_2512_3910, c_51_2513_3911, d_52_2514_3912, e_53_2515_3913, f_54_2516_3914, rst_55_2517_3915) => 
  let val fltPrm_3817_3916 = (blogLength rst_55_2517_3915) in (1 + fltPrm_3817_3916) end
  | Layout2 (a_56_2518_3917 , b_57_2519_3918, rst_58_2520_3919, c_59_2521_3920, d_60_2522_3921, e_61_2523_3922, f_62_2524_3923) => 
  let val fltPrm_3818_3924 = (blogLength rst_58_2520_3919) in (1 + fltPrm_3818_3924) end
  | Layout3 (a_63_2525_3925 , rst_64_2526_3926, b_65_2527_3927, c_66_2528_3928, d_67_2529_3929, e_68_2530_3930, f_69_2531_3931) => 
  let val fltPrm_3819_3932 = (blogLength rst_64_2526_3926) in (1 + fltPrm_3819_3932) end
  | Layout4 (a_70_2532_3933 , b_71_2533_3934, rst_72_2534_3935, d_73_2535_3936, e_74_2536_3937, f_75_2537_3938, g_76_2538_3939) => 
  let val fltPrm_3820_3940 = (blogLength rst_72_2534_3935) in (1 + fltPrm_3820_3940) end
  | Layout5 (rst_77_2539_3941 , a_78_2540_3942, b_79_2541_3943, c_80_2542_3944, d_81_2543_3945, e_82_2544_3946, f_83_2545_3947) => 
  let val fltPrm_3821_3948 = (blogLength rst_77_2539_3941) in (1 + fltPrm_3821_3948) end
  | Layout6 (a_84_2546_3949 , b_85_2547_3950, c_86_2548_3951, d_87_2549_3952, e_88_2550_3953, rst_89_2551_3954, f_90_2552_3955) => 
  let val fltPrm_3822_3956 = (blogLength rst_89_2551_3954) in (1 + fltPrm_3822_3956) end
  | Layout7 (rst_91_2553_3957 , a_92_2554_3958, b_93_2555_3959, c_94_2556_3960, d_95_2557_3961, e_96_2558_3962, f_97_2559_3963) => 
  let val fltPrm_3823_3964 = (blogLength rst_91_2553_3957) in (1 + fltPrm_3823_3964) end
  | Layout8 (a_98_2560_3965 , rst_99_2561_3966, b_100_2562_3967, c_101_2563_3968, d_102_2564_3969, e_103_2565_3970, f_104_2566_3971) => 
  let val fltPrm_3824_3972 = (blogLength rst_99_2561_3966) in (1 + fltPrm_3824_3972) end);

fun searchBlogTags (keyword_45_2507_3905 , tags_46_2508_3906) = (case tags_46_2508_3906 of TagList (list_47_2509_3907) => (searchTagList(keyword_45_2507_3905 , list_47_2509_3907)));

fun emphasizeKeywordInBlock (keyword_42_2504_3901 , contentBlock_43_2505_3902) = (case contentBlock_43_2505_3902 of Plain (list_inline_44_2506_3903) => 
  let val fltPkd_3816_3904 = (emphasizeInlineListForKeyword(keyword_42_2504_3901 , list_inline_44_2506_3903)) in (Plain (fltPkd_3816_3904)) end 
  | Null => Null);

fun caseFn_2483 (keyword_28_2484_3703_4827 , content_30_2485_3704_4828) = (case content_30_2485_3704_4828 of Content (block_38_3705_4829) => 
  let val fltPkd_3880_4830 = (emphasizeKeywordInBlock(keyword_28_2484_3703_4827 , block_38_3705_4829)) in (Content (fltPkd_3880_4830)) end);

fun emphKeywordInTag (keyword_28_2491_3888 , blogs_29_2492_3889) = (case blogs_29_2492_3889 of End => End
  | Layout1 (a, b, c, d, e, f, g) => Layout1 (a, b, c, d, e, f, g)
  | Layout3 (a, b, c, d, e, f, g) => Layout3 (a, b, c, d, e, f, g)
  | Layout4 (a, b, c, d, e, f, g) => Layout4 (a, b, c, d, e, f, g)
  | Layout5 (a, b, c, d, e, f, g) => Layout5 (a, b, c, d, e, f, g)
  | Layout6 (a, b, c, d, e, f, g) => Layout6 (a, b, c, d, e, f, g)
  | Layout7 (a, b, c, d, e, f, g) => Layout7 (a, b, c, d, e, f, g)
  | Layout8 (a, b, c, d, e, f, g) => Layout8 (a, b, c, d, e, f, g)
  | Layout2 (content_30_2493_3890 , tags_31_2494_3891, rst_32_2495_3892, header_33_2496_3893, id_34_2497_3894, author_35_2498_3895, date_36_2499_3896) => 
  let val present_37_2500_3897 = (searchBlogTags(keyword_28_2491_3888 , tags_31_2494_3891)) in 
  (if present_37_2500_3897 then 
  let val newContent_39_2501_3898 = (caseFn_2483(keyword_28_2491_3888 , content_30_2493_3890)) in 
  let val newRst_40_2502_3899 = (emphKeywordInTag(keyword_28_2491_3888 , rst_32_2495_3892)) in (Layout2 (newContent_39_2501_3898 , tags_31_2494_3891, newRst_40_2502_3899, header_33_2496_3893, id_34_2497_3894, author_35_2498_3895, date_36_2499_3896)) end end 
   else 
  let val newRst_41_2503_3900 = (emphKeywordInTag(keyword_28_2491_3888 , rst_32_2495_3892)) in (Layout2 (content_30_2493_3890 , tags_31_2494_3891, newRst_41_2503_3900, header_33_2496_3893, id_34_2497_3894, author_35_2498_3895, date_36_2499_3896)) end) end);
val _ = ((fn true => print "True" | false => print "False") 
  let val blogs_22_2486_3881 = (mkBlogs_layout2(400000 , 500, 5)) in 
  let val vec_19_23_2487_3882 = ((fn internal__ => CharArraySlice.full(CharArray.array(internal__, #"0"))) 1) in 
  let val internal__24_2488_3883 = let val _ = (CharArraySlice.update(vec_19_23_2487_3882 , 0, #"a")) in vec_19_23_2487_3882 end in 
  let val newblgs_26_2490_3885 = (emphKeywordInTag(vec_19_23_2487_3882 , blogs_22_2486_3881)) in 
  let val fltPrm_3814_3886 = (blogLength newblgs_26_2490_3885) in 
  let val fltPrm_3815_3887 = (blogLength blogs_22_2486_3881) in (fltPrm_3814_3886 = fltPrm_3815_3887) end end end end end end);
val _ = print "\n"
