datatype dat_Inline = Str of (CharArraySlice.slice) | Emph of ( dat_PList_v_1064)| Space 
and dat_Block = Plain of ( dat_PList_v_1064) | Null
and dat_BlogHeader = Header of (CharArraySlice.slice)
and dat_BlogId = ID of (int)
and dat_BlogAuthor = Author of (CharArraySlice.slice)
and dat_BlogDate = Date of (CharArraySlice.slice)
and dat_BlogContent = Content of ( dat_Block)
and dat_BlogTags = TagList of ( dat_PList_v_1065)
and dat_Blog = End | Layout1 of ( dat_BlogHeader  *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogContent *  dat_BlogTags *  dat_Blog)| Layout2 of ( dat_BlogContent  *  dat_BlogTags *  dat_Blog *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout3 of ( dat_BlogTags  *  dat_Blog *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout4 of ( dat_BlogTags  *  dat_BlogContent *  dat_Blog *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout5 of ( dat_Blog  *  dat_BlogTags *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout6 of ( dat_BlogHeader  *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogContent *  dat_Blog *  dat_BlogTags)| Layout7 of ( dat_Blog  *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogTags)| Layout8 of ( dat_BlogContent  *  dat_Blog *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogHeader *  dat_BlogTags)
and dat_PList_v_1065 = Nil_v_1065 | Cons_v_1065 of (CharArraySlice.slice  *  dat_PList_v_1065)
and dat_PList_v_1064 = Nil_v_1064 | Cons_v_1064 of ( dat_Inline  *  dat_PList_v_1064)
and dat_PList_v_1067 = Nil_v_1067 | Cons_v_1067 of ( dat_Block  *  dat_PList_v_1067) ;

fun internal_print_PList_v_1065 (arg_2403_3621_4730) = (case arg_2403_3621_4730 of Nil_v_1065 => 
  let val wildcard_2404_3622_4731 = (print "(Nil_v_1065") in 
  let val wildcard_2405_3623_4732 = (print ")") in () end end 
  | Cons_v_1065 (x_2406_3624_4733 , x_2407_3625_4734) => 
  let val wildcard_2410_3626_4735 = (print "(Cons_v_1065") in 
  let val wildcard_2413_3627_4736 = (print " ") in 
  let val y_2408_3628_4737 = (print "Vector") in 
  let val wildcard_2412_3629_4738 = (print " ") in 
  let val y_2409_3630_4739 = (internal_print_PList_v_1065 x_2407_3625_4734) in 
  let val wildcard_2411_3631_4740 = (print ")") in () end end end end end end);

fun internal_traverse_PList_v_1065 (arg_2398_3617_4726) = (case arg_2398_3617_4726 of Nil_v_1065 => () 
  | Cons_v_1065 (x_2399_3618_4727 , x_2400_3619_4728) => 
  let val y_2402_3620_4729 = (internal_traverse_PList_v_1065 x_2400_3619_4728) in () end);

fun internal_copy_without_ptrs_PList_v_1065 (arg_2393_3612_4721) = (case arg_2393_3612_4721 of Nil_v_1065 => Nil_v_1065 
  | Cons_v_1065 (x_2394_3613_4722 , x_2395_3614_4723) => 
  let val y_2397_3616_4725 = (internal_copy_without_ptrs_PList_v_1065 x_2395_3614_4723) in (Cons_v_1065 (x_2394_3613_4722 , y_2397_3616_4725)) end);

fun internal_copy_PList_v_1065 (arg_2388_3607_4716) = (case arg_2388_3607_4716 of Nil_v_1065 => Nil_v_1065 
  | Cons_v_1065 (x_2389_3608_4717 , x_2390_3609_4718) => 
  let val y_2392_3611_4720 = (internal_copy_PList_v_1065 x_2390_3609_4718) in (Cons_v_1065 (x_2389_3608_4717 , y_2392_3611_4720)) end);

fun internal_print_BlogTags (arg_1856_3075_4184) = (case arg_1856_3075_4184 of TagList (x_1857_3076_4185) => 
  let val wildcard_1859_3077_4186 = (print "(TagList") in 
  let val wildcard_1861_3078_4187 = (print " ") in 
  let val y_1858_3079_4188 = (internal_print_PList_v_1065 x_1857_3076_4185) in 
  let val wildcard_1860_3080_4189 = (print ")") in () end end end end);

fun internal_traverse_BlogTags (arg_1853_3072_4181) = (case arg_1853_3072_4181 of TagList (x_1854_3073_4182) => 
  let val y_1855_3074_4183 = (internal_traverse_PList_v_1065 x_1854_3073_4182) in () end);

fun internal_copy_without_ptrs_BlogTags (arg_1850_3069_4178) = (case arg_1850_3069_4178 of TagList (x_1851_3070_4179) => 
  let val y_1852_3071_4180 = (internal_copy_without_ptrs_PList_v_1065 x_1851_3070_4179) in (TagList (y_1852_3071_4180)) end);

fun internal_copy_BlogTags (arg_1847_3066_4175) = (case arg_1847_3066_4175 of TagList (x_1848_3067_4176) => 
  let val y_1849_3068_4177 = (internal_copy_PList_v_1065 x_1848_3067_4176) in (TagList (y_1849_3068_4177)) end);

fun internal_print_BlogDate (arg_1826_3045_4154) = (case arg_1826_3045_4154 of Date (x_1827_3046_4155) => 
  let val wildcard_1829_3047_4156 = (print "(Date") in 
  let val wildcard_1831_3048_4157 = (print " ") in 
  let val y_1828_3049_4158 = (print "Vector") in 
  let val wildcard_1830_3050_4159 = (print ")") in () end end end end);

fun internal_traverse_BlogDate (arg_1823_3043_4152) = (case arg_1823_3043_4152 of Date (x_1824_3044_4153) => ());

fun internal_copy_without_ptrs_BlogDate (arg_1820_3040_4149) = (case arg_1820_3040_4149 of Date (x_1821_3041_4150) => (Date (x_1821_3041_4150)));

fun internal_copy_BlogDate (arg_1817_3037_4146) = (case arg_1817_3037_4146 of Date (x_1818_3038_4147) => (Date (x_1818_3038_4147)));

fun internal_print_BlogAuthor (arg_1811_3031_4140) = (case arg_1811_3031_4140 of Author (x_1812_3032_4141) => 
  let val wildcard_1814_3033_4142 = (print "(Author") in 
  let val wildcard_1816_3034_4143 = (print " ") in 
  let val y_1813_3035_4144 = (print "Vector") in 
  let val wildcard_1815_3036_4145 = (print ")") in () end end end end);

fun internal_traverse_BlogAuthor (arg_1808_3029_4138) = (case arg_1808_3029_4138 of Author (x_1809_3030_4139) => ());

fun internal_copy_without_ptrs_BlogAuthor (arg_1805_3026_4135) = (case arg_1805_3026_4135 of Author (x_1806_3027_4136) => (Author (x_1806_3027_4136)));

fun internal_copy_BlogAuthor (arg_1802_3023_4132) = (case arg_1802_3023_4132 of Author (x_1803_3024_4133) => (Author (x_1803_3024_4133)));

fun internal_print_BlogId (arg_1796_3017_4126) = (case arg_1796_3017_4126 of ID (x_1797_3018_4127) => 
  let val wildcard_1799_3019_4128 = (print "(ID") in 
  let val wildcard_1801_3020_4129 = (print " ") in 
  let val y_1798_3021_4130 = (print(Int.toString(x_1797_3018_4127))) in 
  let val wildcard_1800_3022_4131 = (print ")") in () end end end end);

fun internal_traverse_BlogId (arg_1793_3015_4124) = (case arg_1793_3015_4124 of ID (x_1794_3016_4125) => ());

fun internal_copy_without_ptrs_BlogId (arg_1790_3012_4121) = (case arg_1790_3012_4121 of ID (x_1791_3013_4122) => (ID (x_1791_3013_4122)));

fun internal_copy_BlogId (arg_1787_3009_4118) = (case arg_1787_3009_4118 of ID (x_1788_3010_4119) => (ID (x_1788_3010_4119)));

fun internal_print_BlogHeader (arg_1781_3003_4112) = (case arg_1781_3003_4112 of Header (x_1782_3004_4113) => 
  let val wildcard_1784_3005_4114 = (print "(Header") in 
  let val wildcard_1786_3006_4115 = (print " ") in 
  let val y_1783_3007_4116 = (print "Vector") in 
  let val wildcard_1785_3008_4117 = (print ")") in () end end end end);

fun internal_traverse_BlogHeader (arg_1778_3001_4110) = (case arg_1778_3001_4110 of Header (x_1779_3002_4111) => ());

fun internal_copy_without_ptrs_BlogHeader (arg_1775_2998_4107) = (case arg_1775_2998_4107 of Header (x_1776_2999_4108) => (Header (x_1776_2999_4108)));

fun internal_copy_BlogHeader (arg_1772_2995_4104) = (case arg_1772_2995_4104 of Header (x_1773_2996_4105) => (Header (x_1773_2996_4105)));

fun internal_print_Inline (arg_1742_2965_4074) = (case arg_1742_2965_4074 of Str (x_1743_2966_4075) => 
  let val wildcard_1745_2967_4076 = (print "(Str") in 
  let val wildcard_1747_2968_4077 = (print " ") in 
  let val y_1744_2969_4078 = (print "Vector") in 
  let val wildcard_1746_2970_4079 = (print ")") in () end end end end 
  | Emph (x_1748_2971_4080) => 
  let val wildcard_1750_2972_4081 = (print "(Emph") in 
  let val wildcard_1752_2973_4082 = (print " ") in 
  let val y_1749_2974_4083 = (internal_print_PList_v_1064 x_1748_2971_4080) in 
  let val wildcard_1751_2975_4084 = (print ")") in () end end end end
  | Space => 
  let val wildcard_1753_2976_4085 = (print "(Space") in 
  let val wildcard_1754_2977_4086 = (print ")") in () end end)
and internal_print_PList_v_1064 (arg_2429_3647_4756) = (case arg_2429_3647_4756 of Nil_v_1064 => 
  let val wildcard_2430_3648_4757 = (print "(Nil_v_1064") in 
  let val wildcard_2431_3649_4758 = (print ")") in () end end 
  | Cons_v_1064 (x_2432_3650_4759 , x_2433_3651_4760) => 
  let val wildcard_2436_3652_4761 = (print "(Cons_v_1064") in 
  let val wildcard_2439_3653_4762 = (print " ") in 
  let val y_2434_3654_4763 = (internal_print_Inline x_2432_3650_4759) in 
  let val wildcard_2438_3655_4764 = (print " ") in 
  let val y_2435_3656_4765 = (internal_print_PList_v_1064 x_2433_3651_4760) in 
  let val wildcard_2437_3657_4766 = (print ")") in () end end end end end end);

fun internal_print_Block (arg_1764_2987_4096) = (case arg_1764_2987_4096 of Plain (x_1765_2988_4097) => 
  let val wildcard_1767_2989_4098 = (print "(Plain") in 
  let val wildcard_1769_2990_4099 = (print " ") in 
  let val y_1766_2991_4100 = (internal_print_PList_v_1064 x_1765_2988_4097) in 
  let val wildcard_1768_2992_4101 = (print ")") in () end end end end 
  | Null => 
  let val wildcard_1770_2993_4102 = (print "(Null") in 
  let val wildcard_1771_2994_4103 = (print ")") in () end end);

fun internal_print_BlogContent (arg_1841_3060_4169) = (case arg_1841_3060_4169 of Content (x_1842_3061_4170) => 
  let val wildcard_1844_3062_4171 = (print "(Content") in 
  let val wildcard_1846_3063_4172 = (print " ") in 
  let val y_1843_3064_4173 = (internal_print_Block x_1842_3061_4170) in 
  let val wildcard_1845_3065_4174 = (print ")") in () end end end end);

fun internal_print_Blog (arg_2201_3420_4529) = (case arg_2201_3420_4529 of End => 
  let val wildcard_2202_3421_4530 = (print "(End") in 
  let val wildcard_2203_3422_4531 = (print ")") in () end end 
  | Layout1 (x_2204_3423_4532 , x_2205_3424_4533, x_2206_3425_4534, x_2207_3426_4535, x_2208_3427_4536, x_2209_3428_4537, x_2210_3429_4538) => 
  let val wildcard_2218_3430_4539 = (print "(Layout1") in 
  let val wildcard_2226_3431_4540 = (print " ") in 
  let val y_2211_3432_4541 = (internal_print_BlogHeader x_2204_3423_4532) in 
  let val wildcard_2225_3433_4542 = (print " ") in 
  let val y_2212_3434_4543 = (internal_print_BlogId x_2205_3424_4533) in 
  let val wildcard_2224_3435_4544 = (print " ") in 
  let val y_2213_3436_4545 = (internal_print_BlogAuthor x_2206_3425_4534) in 
  let val wildcard_2223_3437_4546 = (print " ") in 
  let val y_2214_3438_4547 = (internal_print_BlogDate x_2207_3426_4535) in 
  let val wildcard_2222_3439_4548 = (print " ") in 
  let val y_2215_3440_4549 = (internal_print_BlogContent x_2208_3427_4536) in 
  let val wildcard_2221_3441_4550 = (print " ") in 
  let val y_2216_3442_4551 = (internal_print_BlogTags x_2209_3428_4537) in 
  let val wildcard_2220_3443_4552 = (print " ") in 
  let val y_2217_3444_4553 = (internal_print_Blog x_2210_3429_4538) in 
  let val wildcard_2219_3445_4554 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout2 (x_2227_3446_4555 , x_2228_3447_4556, x_2229_3448_4557, x_2230_3449_4558, x_2231_3450_4559, x_2232_3451_4560, x_2233_3452_4561) => 
  let val wildcard_2241_3453_4562 = (print "(Layout2") in 
  let val wildcard_2249_3454_4563 = (print " ") in 
  let val y_2234_3455_4564 = (internal_print_BlogContent x_2227_3446_4555) in 
  let val wildcard_2248_3456_4565 = (print " ") in 
  let val y_2235_3457_4566 = (internal_print_BlogTags x_2228_3447_4556) in 
  let val wildcard_2247_3458_4567 = (print " ") in 
  let val y_2236_3459_4568 = (internal_print_Blog x_2229_3448_4557) in 
  let val wildcard_2246_3460_4569 = (print " ") in 
  let val y_2237_3461_4570 = (internal_print_BlogHeader x_2230_3449_4558) in 
  let val wildcard_2245_3462_4571 = (print " ") in 
  let val y_2238_3463_4572 = (internal_print_BlogId x_2231_3450_4559) in 
  let val wildcard_2244_3464_4573 = (print " ") in 
  let val y_2239_3465_4574 = (internal_print_BlogAuthor x_2232_3451_4560) in 
  let val wildcard_2243_3466_4575 = (print " ") in 
  let val y_2240_3467_4576 = (internal_print_BlogDate x_2233_3452_4561) in 
  let val wildcard_2242_3468_4577 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout3 (x_2250_3469_4578 , x_2251_3470_4579, x_2252_3471_4580, x_2253_3472_4581, x_2254_3473_4582, x_2255_3474_4583, x_2256_3475_4584) => 
  let val wildcard_2264_3476_4585 = (print "(Layout3") in 
  let val wildcard_2272_3477_4586 = (print " ") in 
  let val y_2257_3478_4587 = (internal_print_BlogTags x_2250_3469_4578) in 
  let val wildcard_2271_3479_4588 = (print " ") in 
  let val y_2258_3480_4589 = (internal_print_Blog x_2251_3470_4579) in 
  let val wildcard_2270_3481_4590 = (print " ") in 
  let val y_2259_3482_4591 = (internal_print_BlogContent x_2252_3471_4580) in 
  let val wildcard_2269_3483_4592 = (print " ") in 
  let val y_2260_3484_4593 = (internal_print_BlogHeader x_2253_3472_4581) in 
  let val wildcard_2268_3485_4594 = (print " ") in 
  let val y_2261_3486_4595 = (internal_print_BlogId x_2254_3473_4582) in 
  let val wildcard_2267_3487_4596 = (print " ") in 
  let val y_2262_3488_4597 = (internal_print_BlogAuthor x_2255_3474_4583) in 
  let val wildcard_2266_3489_4598 = (print " ") in 
  let val y_2263_3490_4599 = (internal_print_BlogDate x_2256_3475_4584) in 
  let val wildcard_2265_3491_4600 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout4 (x_2273_3492_4601 , x_2274_3493_4602, x_2275_3494_4603, x_2276_3495_4604, x_2277_3496_4605, x_2278_3497_4606, x_2279_3498_4607) => 
  let val wildcard_2287_3499_4608 = (print "(Layout4") in 
  let val wildcard_2295_3500_4609 = (print " ") in 
  let val y_2280_3501_4610 = (internal_print_BlogTags x_2273_3492_4601) in 
  let val wildcard_2294_3502_4611 = (print " ") in 
  let val y_2281_3503_4612 = (internal_print_BlogContent x_2274_3493_4602) in 
  let val wildcard_2293_3504_4613 = (print " ") in 
  let val y_2282_3505_4614 = (internal_print_Blog x_2275_3494_4603) in 
  let val wildcard_2292_3506_4615 = (print " ") in 
  let val y_2283_3507_4616 = (internal_print_BlogHeader x_2276_3495_4604) in 
  let val wildcard_2291_3508_4617 = (print " ") in 
  let val y_2284_3509_4618 = (internal_print_BlogId x_2277_3496_4605) in 
  let val wildcard_2290_3510_4619 = (print " ") in 
  let val y_2285_3511_4620 = (internal_print_BlogAuthor x_2278_3497_4606) in 
  let val wildcard_2289_3512_4621 = (print " ") in 
  let val y_2286_3513_4622 = (internal_print_BlogDate x_2279_3498_4607) in 
  let val wildcard_2288_3514_4623 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout5 (x_2296_3515_4624 , x_2297_3516_4625, x_2298_3517_4626, x_2299_3518_4627, x_2300_3519_4628, x_2301_3520_4629, x_2302_3521_4630) => 
  let val wildcard_2310_3522_4631 = (print "(Layout5") in 
  let val wildcard_2318_3523_4632 = (print " ") in 
  let val y_2303_3524_4633 = (internal_print_Blog x_2296_3515_4624) in 
  let val wildcard_2317_3525_4634 = (print " ") in 
  let val y_2304_3526_4635 = (internal_print_BlogTags x_2297_3516_4625) in 
  let val wildcard_2316_3527_4636 = (print " ") in 
  let val y_2305_3528_4637 = (internal_print_BlogContent x_2298_3517_4626) in 
  let val wildcard_2315_3529_4638 = (print " ") in 
  let val y_2306_3530_4639 = (internal_print_BlogHeader x_2299_3518_4627) in 
  let val wildcard_2314_3531_4640 = (print " ") in 
  let val y_2307_3532_4641 = (internal_print_BlogId x_2300_3519_4628) in 
  let val wildcard_2313_3533_4642 = (print " ") in 
  let val y_2308_3534_4643 = (internal_print_BlogAuthor x_2301_3520_4629) in 
  let val wildcard_2312_3535_4644 = (print " ") in 
  let val y_2309_3536_4645 = (internal_print_BlogDate x_2302_3521_4630) in 
  let val wildcard_2311_3537_4646 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout6 (x_2319_3538_4647 , x_2320_3539_4648, x_2321_3540_4649, x_2322_3541_4650, x_2323_3542_4651, x_2324_3543_4652, x_2325_3544_4653) => 
  let val wildcard_2333_3545_4654 = (print "(Layout6") in 
  let val wildcard_2341_3546_4655 = (print " ") in 
  let val y_2326_3547_4656 = (internal_print_BlogHeader x_2319_3538_4647) in 
  let val wildcard_2340_3548_4657 = (print " ") in 
  let val y_2327_3549_4658 = (internal_print_BlogId x_2320_3539_4648) in 
  let val wildcard_2339_3550_4659 = (print " ") in 
  let val y_2328_3551_4660 = (internal_print_BlogAuthor x_2321_3540_4649) in 
  let val wildcard_2338_3552_4661 = (print " ") in 
  let val y_2329_3553_4662 = (internal_print_BlogDate x_2322_3541_4650) in 
  let val wildcard_2337_3554_4663 = (print " ") in 
  let val y_2330_3555_4664 = (internal_print_BlogContent x_2323_3542_4651) in 
  let val wildcard_2336_3556_4665 = (print " ") in 
  let val y_2331_3557_4666 = (internal_print_Blog x_2324_3543_4652) in 
  let val wildcard_2335_3558_4667 = (print " ") in 
  let val y_2332_3559_4668 = (internal_print_BlogTags x_2325_3544_4653) in 
  let val wildcard_2334_3560_4669 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout7 (x_2342_3561_4670 , x_2343_3562_4671, x_2344_3563_4672, x_2345_3564_4673, x_2346_3565_4674, x_2347_3566_4675, x_2348_3567_4676) => 
  let val wildcard_2356_3568_4677 = (print "(Layout7") in 
  let val wildcard_2364_3569_4678 = (print " ") in 
  let val y_2349_3570_4679 = (internal_print_Blog x_2342_3561_4670) in 
  let val wildcard_2363_3571_4680 = (print " ") in 
  let val y_2350_3572_4681 = (internal_print_BlogContent x_2343_3562_4671) in 
  let val wildcard_2362_3573_4682 = (print " ") in 
  let val y_2351_3574_4683 = (internal_print_BlogHeader x_2344_3563_4672) in 
  let val wildcard_2361_3575_4684 = (print " ") in 
  let val y_2352_3576_4685 = (internal_print_BlogId x_2345_3564_4673) in 
  let val wildcard_2360_3577_4686 = (print " ") in 
  let val y_2353_3578_4687 = (internal_print_BlogAuthor x_2346_3565_4674) in 
  let val wildcard_2359_3579_4688 = (print " ") in 
  let val y_2354_3580_4689 = (internal_print_BlogDate x_2347_3566_4675) in 
  let val wildcard_2358_3581_4690 = (print " ") in 
  let val y_2355_3582_4691 = (internal_print_BlogTags x_2348_3567_4676) in 
  let val wildcard_2357_3583_4692 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout8 (x_2365_3584_4693 , x_2366_3585_4694, x_2367_3586_4695, x_2368_3587_4696, x_2369_3588_4697, x_2370_3589_4698, x_2371_3590_4699) => 
  let val wildcard_2379_3591_4700 = (print "(Layout8") in 
  let val wildcard_2387_3592_4701 = (print " ") in 
  let val y_2372_3593_4702 = (internal_print_BlogContent x_2365_3584_4693) in 
  let val wildcard_2386_3594_4703 = (print " ") in 
  let val y_2373_3595_4704 = (internal_print_Blog x_2366_3585_4694) in 
  let val wildcard_2385_3596_4705 = (print " ") in 
  let val y_2374_3597_4706 = (internal_print_BlogId x_2367_3586_4695) in 
  let val wildcard_2384_3598_4707 = (print " ") in 
  let val y_2375_3599_4708 = (internal_print_BlogAuthor x_2368_3587_4696) in 
  let val wildcard_2383_3600_4709 = (print " ") in 
  let val y_2376_3601_4710 = (internal_print_BlogDate x_2369_3588_4697) in 
  let val wildcard_2382_3602_4711 = (print " ") in 
  let val y_2377_3603_4712 = (internal_print_BlogHeader x_2370_3589_4698) in 
  let val wildcard_2381_3604_4713 = (print " ") in 
  let val y_2378_3605_4714 = (internal_print_BlogTags x_2371_3590_4699) in 
  let val wildcard_2380_3606_4715 = (print ")") in () end end end end end end end end end end end end end end end end);

fun internal_print_PList_v_1067 (arg_2455_3673_4782) = (case arg_2455_3673_4782 of Nil_v_1067 => 
  let val wildcard_2456_3674_4783 = (print "(Nil_v_1067") in 
  let val wildcard_2457_3675_4784 = (print ")") in () end end 
  | Cons_v_1067 (x_2458_3676_4785 , x_2459_3677_4786) => 
  let val wildcard_2462_3678_4787 = (print "(Cons_v_1067") in 
  let val wildcard_2465_3679_4788 = (print " ") in 
  let val y_2460_3680_4789 = (internal_print_Block x_2458_3676_4785) in 
  let val wildcard_2464_3681_4790 = (print " ") in 
  let val y_2461_3682_4791 = (internal_print_PList_v_1067 x_2459_3677_4786) in 
  let val wildcard_2463_3683_4792 = (print ")") in () end end end end end end);

fun internal_traverse_Inline (arg_1737_2961_4070) = (case arg_1737_2961_4070 of Str (x_1738_2962_4071) => () 
  | Emph (x_1740_2963_4072) => 
  let val y_1741_2964_4073 = (internal_traverse_PList_v_1064 x_1740_2963_4072) in () end
  | Space => ())
and internal_traverse_PList_v_1064 (arg_2424_3642_4751) = (case arg_2424_3642_4751 of Nil_v_1064 => () 
  | Cons_v_1064 (x_2425_3643_4752 , x_2426_3644_4753) => 
  let val y_2427_3645_4754 = (internal_traverse_Inline x_2425_3643_4752) in 
  let val y_2428_3646_4755 = (internal_traverse_PList_v_1064 x_2426_3644_4753) in () end end);

fun internal_traverse_Block (arg_1761_2984_4093) = (case arg_1761_2984_4093 of Plain (x_1762_2985_4094) => 
  let val y_1763_2986_4095 = (internal_traverse_PList_v_1064 x_1762_2985_4094) in () end 
  | Null => ());

fun internal_traverse_BlogContent (arg_1838_3057_4166) = (case arg_1838_3057_4166 of Content (x_1839_3058_4167) => 
  let val y_1840_3059_4168 = (internal_traverse_Block x_1839_3058_4167) in () end);

fun internal_traverse_Blog (arg_2088_3307_4416) = (case arg_2088_3307_4416 of End => () 
  | Layout1 (x_2089_3308_4417 , x_2090_3309_4418, x_2091_3310_4419, x_2092_3311_4420, x_2093_3312_4421, x_2094_3313_4422, x_2095_3314_4423) => 
  let val y_2096_3315_4424 = (internal_traverse_BlogHeader x_2089_3308_4417) in 
  let val y_2097_3316_4425 = (internal_traverse_BlogId x_2090_3309_4418) in 
  let val y_2098_3317_4426 = (internal_traverse_BlogAuthor x_2091_3310_4419) in 
  let val y_2099_3318_4427 = (internal_traverse_BlogDate x_2092_3311_4420) in 
  let val y_2100_3319_4428 = (internal_traverse_BlogContent x_2093_3312_4421) in 
  let val y_2101_3320_4429 = (internal_traverse_BlogTags x_2094_3313_4422) in 
  let val y_2102_3321_4430 = (internal_traverse_Blog x_2095_3314_4423) in () end end end end end end end
  | Layout2 (x_2103_3322_4431 , x_2104_3323_4432, x_2105_3324_4433, x_2106_3325_4434, x_2107_3326_4435, x_2108_3327_4436, x_2109_3328_4437) => 
  let val y_2110_3329_4438 = (internal_traverse_BlogContent x_2103_3322_4431) in 
  let val y_2111_3330_4439 = (internal_traverse_BlogTags x_2104_3323_4432) in 
  let val y_2112_3331_4440 = (internal_traverse_Blog x_2105_3324_4433) in 
  let val y_2113_3332_4441 = (internal_traverse_BlogHeader x_2106_3325_4434) in 
  let val y_2114_3333_4442 = (internal_traverse_BlogId x_2107_3326_4435) in 
  let val y_2115_3334_4443 = (internal_traverse_BlogAuthor x_2108_3327_4436) in 
  let val y_2116_3335_4444 = (internal_traverse_BlogDate x_2109_3328_4437) in () end end end end end end end
  | Layout3 (x_2117_3336_4445 , x_2118_3337_4446, x_2119_3338_4447, x_2120_3339_4448, x_2121_3340_4449, x_2122_3341_4450, x_2123_3342_4451) => 
  let val y_2124_3343_4452 = (internal_traverse_BlogTags x_2117_3336_4445) in 
  let val y_2125_3344_4453 = (internal_traverse_Blog x_2118_3337_4446) in 
  let val y_2126_3345_4454 = (internal_traverse_BlogContent x_2119_3338_4447) in 
  let val y_2127_3346_4455 = (internal_traverse_BlogHeader x_2120_3339_4448) in 
  let val y_2128_3347_4456 = (internal_traverse_BlogId x_2121_3340_4449) in 
  let val y_2129_3348_4457 = (internal_traverse_BlogAuthor x_2122_3341_4450) in 
  let val y_2130_3349_4458 = (internal_traverse_BlogDate x_2123_3342_4451) in () end end end end end end end
  | Layout4 (x_2131_3350_4459 , x_2132_3351_4460, x_2133_3352_4461, x_2134_3353_4462, x_2135_3354_4463, x_2136_3355_4464, x_2137_3356_4465) => 
  let val y_2138_3357_4466 = (internal_traverse_BlogTags x_2131_3350_4459) in 
  let val y_2139_3358_4467 = (internal_traverse_BlogContent x_2132_3351_4460) in 
  let val y_2140_3359_4468 = (internal_traverse_Blog x_2133_3352_4461) in 
  let val y_2141_3360_4469 = (internal_traverse_BlogHeader x_2134_3353_4462) in 
  let val y_2142_3361_4470 = (internal_traverse_BlogId x_2135_3354_4463) in 
  let val y_2143_3362_4471 = (internal_traverse_BlogAuthor x_2136_3355_4464) in 
  let val y_2144_3363_4472 = (internal_traverse_BlogDate x_2137_3356_4465) in () end end end end end end end
  | Layout5 (x_2145_3364_4473 , x_2146_3365_4474, x_2147_3366_4475, x_2148_3367_4476, x_2149_3368_4477, x_2150_3369_4478, x_2151_3370_4479) => 
  let val y_2152_3371_4480 = (internal_traverse_Blog x_2145_3364_4473) in 
  let val y_2153_3372_4481 = (internal_traverse_BlogTags x_2146_3365_4474) in 
  let val y_2154_3373_4482 = (internal_traverse_BlogContent x_2147_3366_4475) in 
  let val y_2155_3374_4483 = (internal_traverse_BlogHeader x_2148_3367_4476) in 
  let val y_2156_3375_4484 = (internal_traverse_BlogId x_2149_3368_4477) in 
  let val y_2157_3376_4485 = (internal_traverse_BlogAuthor x_2150_3369_4478) in 
  let val y_2158_3377_4486 = (internal_traverse_BlogDate x_2151_3370_4479) in () end end end end end end end
  | Layout6 (x_2159_3378_4487 , x_2160_3379_4488, x_2161_3380_4489, x_2162_3381_4490, x_2163_3382_4491, x_2164_3383_4492, x_2165_3384_4493) => 
  let val y_2166_3385_4494 = (internal_traverse_BlogHeader x_2159_3378_4487) in 
  let val y_2167_3386_4495 = (internal_traverse_BlogId x_2160_3379_4488) in 
  let val y_2168_3387_4496 = (internal_traverse_BlogAuthor x_2161_3380_4489) in 
  let val y_2169_3388_4497 = (internal_traverse_BlogDate x_2162_3381_4490) in 
  let val y_2170_3389_4498 = (internal_traverse_BlogContent x_2163_3382_4491) in 
  let val y_2171_3390_4499 = (internal_traverse_Blog x_2164_3383_4492) in 
  let val y_2172_3391_4500 = (internal_traverse_BlogTags x_2165_3384_4493) in () end end end end end end end
  | Layout7 (x_2173_3392_4501 , x_2174_3393_4502, x_2175_3394_4503, x_2176_3395_4504, x_2177_3396_4505, x_2178_3397_4506, x_2179_3398_4507) => 
  let val y_2180_3399_4508 = (internal_traverse_Blog x_2173_3392_4501) in 
  let val y_2181_3400_4509 = (internal_traverse_BlogContent x_2174_3393_4502) in 
  let val y_2182_3401_4510 = (internal_traverse_BlogHeader x_2175_3394_4503) in 
  let val y_2183_3402_4511 = (internal_traverse_BlogId x_2176_3395_4504) in 
  let val y_2184_3403_4512 = (internal_traverse_BlogAuthor x_2177_3396_4505) in 
  let val y_2185_3404_4513 = (internal_traverse_BlogDate x_2178_3397_4506) in 
  let val y_2186_3405_4514 = (internal_traverse_BlogTags x_2179_3398_4507) in () end end end end end end end
  | Layout8 (x_2187_3406_4515 , x_2188_3407_4516, x_2189_3408_4517, x_2190_3409_4518, x_2191_3410_4519, x_2192_3411_4520, x_2193_3412_4521) => 
  let val y_2194_3413_4522 = (internal_traverse_BlogContent x_2187_3406_4515) in 
  let val y_2195_3414_4523 = (internal_traverse_Blog x_2188_3407_4516) in 
  let val y_2196_3415_4524 = (internal_traverse_BlogId x_2189_3408_4517) in 
  let val y_2197_3416_4525 = (internal_traverse_BlogAuthor x_2190_3409_4518) in 
  let val y_2198_3417_4526 = (internal_traverse_BlogDate x_2191_3410_4519) in 
  let val y_2199_3418_4527 = (internal_traverse_BlogHeader x_2192_3411_4520) in 
  let val y_2200_3419_4528 = (internal_traverse_BlogTags x_2193_3412_4521) in () end end end end end end end);

fun internal_traverse_PList_v_1067 (arg_2450_3668_4777) = (case arg_2450_3668_4777 of Nil_v_1067 => () 
  | Cons_v_1067 (x_2451_3669_4778 , x_2452_3670_4779) => 
  let val y_2453_3671_4780 = (internal_traverse_Block x_2451_3669_4778) in 
  let val y_2454_3672_4781 = (internal_traverse_PList_v_1067 x_2452_3670_4779) in () end end);

fun internal_copy_without_ptrs_Inline (arg_1732_2956_4065) = (case arg_1732_2956_4065 of Str (x_1733_2957_4066) => (Str (x_1733_2957_4066)) 
  | Emph (x_1735_2959_4068) => 
  let val y_1736_2960_4069 = (internal_copy_without_ptrs_PList_v_1064 x_1735_2959_4068) in (Emph (y_1736_2960_4069)) end
  | Space => Space)
and internal_copy_without_ptrs_PList_v_1064 (arg_2419_3637_4746) = (case arg_2419_3637_4746 of Nil_v_1064 => Nil_v_1064 
  | Cons_v_1064 (x_2420_3638_4747 , x_2421_3639_4748) => 
  let val y_2422_3640_4749 = (internal_copy_without_ptrs_Inline x_2420_3638_4747) in 
  let val y_2423_3641_4750 = (internal_copy_without_ptrs_PList_v_1064 x_2421_3639_4748) in (Cons_v_1064 (y_2422_3640_4749 , y_2423_3641_4750)) end end);

fun internal_copy_without_ptrs_Block (arg_1758_2981_4090) = (case arg_1758_2981_4090 of Plain (x_1759_2982_4091) => 
  let val y_1760_2983_4092 = (internal_copy_without_ptrs_PList_v_1064 x_1759_2982_4091) in (Plain (y_1760_2983_4092)) end 
  | Null => Null);

fun internal_copy_without_ptrs_BlogContent (arg_1835_3054_4163) = (case arg_1835_3054_4163 of Content (x_1836_3055_4164) => 
  let val y_1837_3056_4165 = (internal_copy_without_ptrs_Block x_1836_3055_4164) in (Content (y_1837_3056_4165)) end);

fun internal_copy_without_ptrs_Blog (arg_1975_3194_4303) = (case arg_1975_3194_4303 of End => End 
  | Layout1 (x_1976_3195_4304 , x_1977_3196_4305, x_1978_3197_4306, x_1979_3198_4307, x_1980_3199_4308, x_1981_3200_4309, x_1982_3201_4310) => 
  let val y_1983_3202_4311 = (internal_copy_without_ptrs_BlogHeader x_1976_3195_4304) in 
  let val y_1984_3203_4312 = (internal_copy_without_ptrs_BlogId x_1977_3196_4305) in 
  let val y_1985_3204_4313 = (internal_copy_without_ptrs_BlogAuthor x_1978_3197_4306) in 
  let val y_1986_3205_4314 = (internal_copy_without_ptrs_BlogDate x_1979_3198_4307) in 
  let val y_1987_3206_4315 = (internal_copy_without_ptrs_BlogContent x_1980_3199_4308) in 
  let val y_1988_3207_4316 = (internal_copy_without_ptrs_BlogTags x_1981_3200_4309) in 
  let val y_1989_3208_4317 = (internal_copy_without_ptrs_Blog x_1982_3201_4310) in (Layout1 (y_1983_3202_4311 , y_1984_3203_4312, y_1985_3204_4313, y_1986_3205_4314, y_1987_3206_4315, y_1988_3207_4316, y_1989_3208_4317)) end end end end end end end
  | Layout2 (x_1990_3209_4318 , x_1991_3210_4319, x_1992_3211_4320, x_1993_3212_4321, x_1994_3213_4322, x_1995_3214_4323, x_1996_3215_4324) => 
  let val y_1997_3216_4325 = (internal_copy_without_ptrs_BlogContent x_1990_3209_4318) in 
  let val y_1998_3217_4326 = (internal_copy_without_ptrs_BlogTags x_1991_3210_4319) in 
  let val y_1999_3218_4327 = (internal_copy_without_ptrs_Blog x_1992_3211_4320) in 
  let val y_2000_3219_4328 = (internal_copy_without_ptrs_BlogHeader x_1993_3212_4321) in 
  let val y_2001_3220_4329 = (internal_copy_without_ptrs_BlogId x_1994_3213_4322) in 
  let val y_2002_3221_4330 = (internal_copy_without_ptrs_BlogAuthor x_1995_3214_4323) in 
  let val y_2003_3222_4331 = (internal_copy_without_ptrs_BlogDate x_1996_3215_4324) in (Layout2 (y_1997_3216_4325 , y_1998_3217_4326, y_1999_3218_4327, y_2000_3219_4328, y_2001_3220_4329, y_2002_3221_4330, y_2003_3222_4331)) end end end end end end end
  | Layout3 (x_2004_3223_4332 , x_2005_3224_4333, x_2006_3225_4334, x_2007_3226_4335, x_2008_3227_4336, x_2009_3228_4337, x_2010_3229_4338) => 
  let val y_2011_3230_4339 = (internal_copy_without_ptrs_BlogTags x_2004_3223_4332) in 
  let val y_2012_3231_4340 = (internal_copy_without_ptrs_Blog x_2005_3224_4333) in 
  let val y_2013_3232_4341 = (internal_copy_without_ptrs_BlogContent x_2006_3225_4334) in 
  let val y_2014_3233_4342 = (internal_copy_without_ptrs_BlogHeader x_2007_3226_4335) in 
  let val y_2015_3234_4343 = (internal_copy_without_ptrs_BlogId x_2008_3227_4336) in 
  let val y_2016_3235_4344 = (internal_copy_without_ptrs_BlogAuthor x_2009_3228_4337) in 
  let val y_2017_3236_4345 = (internal_copy_without_ptrs_BlogDate x_2010_3229_4338) in (Layout3 (y_2011_3230_4339 , y_2012_3231_4340, y_2013_3232_4341, y_2014_3233_4342, y_2015_3234_4343, y_2016_3235_4344, y_2017_3236_4345)) end end end end end end end
  | Layout4 (x_2018_3237_4346 , x_2019_3238_4347, x_2020_3239_4348, x_2021_3240_4349, x_2022_3241_4350, x_2023_3242_4351, x_2024_3243_4352) => 
  let val y_2025_3244_4353 = (internal_copy_without_ptrs_BlogTags x_2018_3237_4346) in 
  let val y_2026_3245_4354 = (internal_copy_without_ptrs_BlogContent x_2019_3238_4347) in 
  let val y_2027_3246_4355 = (internal_copy_without_ptrs_Blog x_2020_3239_4348) in 
  let val y_2028_3247_4356 = (internal_copy_without_ptrs_BlogHeader x_2021_3240_4349) in 
  let val y_2029_3248_4357 = (internal_copy_without_ptrs_BlogId x_2022_3241_4350) in 
  let val y_2030_3249_4358 = (internal_copy_without_ptrs_BlogAuthor x_2023_3242_4351) in 
  let val y_2031_3250_4359 = (internal_copy_without_ptrs_BlogDate x_2024_3243_4352) in (Layout4 (y_2025_3244_4353 , y_2026_3245_4354, y_2027_3246_4355, y_2028_3247_4356, y_2029_3248_4357, y_2030_3249_4358, y_2031_3250_4359)) end end end end end end end
  | Layout5 (x_2032_3251_4360 , x_2033_3252_4361, x_2034_3253_4362, x_2035_3254_4363, x_2036_3255_4364, x_2037_3256_4365, x_2038_3257_4366) => 
  let val y_2039_3258_4367 = (internal_copy_without_ptrs_Blog x_2032_3251_4360) in 
  let val y_2040_3259_4368 = (internal_copy_without_ptrs_BlogTags x_2033_3252_4361) in 
  let val y_2041_3260_4369 = (internal_copy_without_ptrs_BlogContent x_2034_3253_4362) in 
  let val y_2042_3261_4370 = (internal_copy_without_ptrs_BlogHeader x_2035_3254_4363) in 
  let val y_2043_3262_4371 = (internal_copy_without_ptrs_BlogId x_2036_3255_4364) in 
  let val y_2044_3263_4372 = (internal_copy_without_ptrs_BlogAuthor x_2037_3256_4365) in 
  let val y_2045_3264_4373 = (internal_copy_without_ptrs_BlogDate x_2038_3257_4366) in (Layout5 (y_2039_3258_4367 , y_2040_3259_4368, y_2041_3260_4369, y_2042_3261_4370, y_2043_3262_4371, y_2044_3263_4372, y_2045_3264_4373)) end end end end end end end
  | Layout6 (x_2046_3265_4374 , x_2047_3266_4375, x_2048_3267_4376, x_2049_3268_4377, x_2050_3269_4378, x_2051_3270_4379, x_2052_3271_4380) => 
  let val y_2053_3272_4381 = (internal_copy_without_ptrs_BlogHeader x_2046_3265_4374) in 
  let val y_2054_3273_4382 = (internal_copy_without_ptrs_BlogId x_2047_3266_4375) in 
  let val y_2055_3274_4383 = (internal_copy_without_ptrs_BlogAuthor x_2048_3267_4376) in 
  let val y_2056_3275_4384 = (internal_copy_without_ptrs_BlogDate x_2049_3268_4377) in 
  let val y_2057_3276_4385 = (internal_copy_without_ptrs_BlogContent x_2050_3269_4378) in 
  let val y_2058_3277_4386 = (internal_copy_without_ptrs_Blog x_2051_3270_4379) in 
  let val y_2059_3278_4387 = (internal_copy_without_ptrs_BlogTags x_2052_3271_4380) in (Layout6 (y_2053_3272_4381 , y_2054_3273_4382, y_2055_3274_4383, y_2056_3275_4384, y_2057_3276_4385, y_2058_3277_4386, y_2059_3278_4387)) end end end end end end end
  | Layout7 (x_2060_3279_4388 , x_2061_3280_4389, x_2062_3281_4390, x_2063_3282_4391, x_2064_3283_4392, x_2065_3284_4393, x_2066_3285_4394) => 
  let val y_2067_3286_4395 = (internal_copy_without_ptrs_Blog x_2060_3279_4388) in 
  let val y_2068_3287_4396 = (internal_copy_without_ptrs_BlogContent x_2061_3280_4389) in 
  let val y_2069_3288_4397 = (internal_copy_without_ptrs_BlogHeader x_2062_3281_4390) in 
  let val y_2070_3289_4398 = (internal_copy_without_ptrs_BlogId x_2063_3282_4391) in 
  let val y_2071_3290_4399 = (internal_copy_without_ptrs_BlogAuthor x_2064_3283_4392) in 
  let val y_2072_3291_4400 = (internal_copy_without_ptrs_BlogDate x_2065_3284_4393) in 
  let val y_2073_3292_4401 = (internal_copy_without_ptrs_BlogTags x_2066_3285_4394) in (Layout7 (y_2067_3286_4395 , y_2068_3287_4396, y_2069_3288_4397, y_2070_3289_4398, y_2071_3290_4399, y_2072_3291_4400, y_2073_3292_4401)) end end end end end end end
  | Layout8 (x_2074_3293_4402 , x_2075_3294_4403, x_2076_3295_4404, x_2077_3296_4405, x_2078_3297_4406, x_2079_3298_4407, x_2080_3299_4408) => 
  let val y_2081_3300_4409 = (internal_copy_without_ptrs_BlogContent x_2074_3293_4402) in 
  let val y_2082_3301_4410 = (internal_copy_without_ptrs_Blog x_2075_3294_4403) in 
  let val y_2083_3302_4411 = (internal_copy_without_ptrs_BlogId x_2076_3295_4404) in 
  let val y_2084_3303_4412 = (internal_copy_without_ptrs_BlogAuthor x_2077_3296_4405) in 
  let val y_2085_3304_4413 = (internal_copy_without_ptrs_BlogDate x_2078_3297_4406) in 
  let val y_2086_3305_4414 = (internal_copy_without_ptrs_BlogHeader x_2079_3298_4407) in 
  let val y_2087_3306_4415 = (internal_copy_without_ptrs_BlogTags x_2080_3299_4408) in (Layout8 (y_2081_3300_4409 , y_2082_3301_4410, y_2083_3302_4411, y_2084_3303_4412, y_2085_3304_4413, y_2086_3305_4414, y_2087_3306_4415)) end end end end end end end);

fun internal_copy_without_ptrs_PList_v_1067 (arg_2445_3663_4772) = (case arg_2445_3663_4772 of Nil_v_1067 => Nil_v_1067 
  | Cons_v_1067 (x_2446_3664_4773 , x_2447_3665_4774) => 
  let val y_2448_3666_4775 = (internal_copy_without_ptrs_Block x_2446_3664_4773) in 
  let val y_2449_3667_4776 = (internal_copy_without_ptrs_PList_v_1067 x_2447_3665_4774) in (Cons_v_1067 (y_2448_3666_4775 , y_2449_3667_4776)) end end);

fun internal_copy_Inline (arg_1727_2951_4060) = (case arg_1727_2951_4060 of Str (x_1728_2952_4061) => (Str (x_1728_2952_4061)) 
  | Emph (x_1730_2954_4063) => 
  let val y_1731_2955_4064 = (internal_copy_PList_v_1064 x_1730_2954_4063) in (Emph (y_1731_2955_4064)) end
  | Space => Space)
and internal_copy_PList_v_1064 (arg_2414_3632_4741) = (case arg_2414_3632_4741 of Nil_v_1064 => Nil_v_1064 
  | Cons_v_1064 (x_2415_3633_4742 , x_2416_3634_4743) => 
  let val y_2417_3635_4744 = (internal_copy_Inline x_2415_3633_4742) in 
  let val y_2418_3636_4745 = (internal_copy_PList_v_1064 x_2416_3634_4743) in (Cons_v_1064 (y_2417_3635_4744 , y_2418_3636_4745)) end end);

fun internal_copy_Block (arg_1755_2978_4087) = (case arg_1755_2978_4087 of Plain (x_1756_2979_4088) => 
  let val y_1757_2980_4089 = (internal_copy_PList_v_1064 x_1756_2979_4088) in (Plain (y_1757_2980_4089)) end 
  | Null => Null);

fun internal_copy_BlogContent (arg_1832_3051_4160) = (case arg_1832_3051_4160 of Content (x_1833_3052_4161) => 
  let val y_1834_3053_4162 = (internal_copy_Block x_1833_3052_4161) in (Content (y_1834_3053_4162)) end);

fun internal_copy_Blog (arg_1862_3081_4190) = (case arg_1862_3081_4190 of End => End 
  | Layout1 (x_1863_3082_4191 , x_1864_3083_4192, x_1865_3084_4193, x_1866_3085_4194, x_1867_3086_4195, x_1868_3087_4196, x_1869_3088_4197) => 
  let val y_1870_3089_4198 = (internal_copy_BlogHeader x_1863_3082_4191) in 
  let val y_1871_3090_4199 = (internal_copy_BlogId x_1864_3083_4192) in 
  let val y_1872_3091_4200 = (internal_copy_BlogAuthor x_1865_3084_4193) in 
  let val y_1873_3092_4201 = (internal_copy_BlogDate x_1866_3085_4194) in 
  let val y_1874_3093_4202 = (internal_copy_BlogContent x_1867_3086_4195) in 
  let val y_1875_3094_4203 = (internal_copy_BlogTags x_1868_3087_4196) in 
  let val y_1876_3095_4204 = (internal_copy_Blog x_1869_3088_4197) in (Layout1 (y_1870_3089_4198 , y_1871_3090_4199, y_1872_3091_4200, y_1873_3092_4201, y_1874_3093_4202, y_1875_3094_4203, y_1876_3095_4204)) end end end end end end end
  | Layout2 (x_1877_3096_4205 , x_1878_3097_4206, x_1879_3098_4207, x_1880_3099_4208, x_1881_3100_4209, x_1882_3101_4210, x_1883_3102_4211) => 
  let val y_1884_3103_4212 = (internal_copy_BlogContent x_1877_3096_4205) in 
  let val y_1885_3104_4213 = (internal_copy_BlogTags x_1878_3097_4206) in 
  let val y_1886_3105_4214 = (internal_copy_Blog x_1879_3098_4207) in 
  let val y_1887_3106_4215 = (internal_copy_BlogHeader x_1880_3099_4208) in 
  let val y_1888_3107_4216 = (internal_copy_BlogId x_1881_3100_4209) in 
  let val y_1889_3108_4217 = (internal_copy_BlogAuthor x_1882_3101_4210) in 
  let val y_1890_3109_4218 = (internal_copy_BlogDate x_1883_3102_4211) in (Layout2 (y_1884_3103_4212 , y_1885_3104_4213, y_1886_3105_4214, y_1887_3106_4215, y_1888_3107_4216, y_1889_3108_4217, y_1890_3109_4218)) end end end end end end end
  | Layout3 (x_1891_3110_4219 , x_1892_3111_4220, x_1893_3112_4221, x_1894_3113_4222, x_1895_3114_4223, x_1896_3115_4224, x_1897_3116_4225) => 
  let val y_1898_3117_4226 = (internal_copy_BlogTags x_1891_3110_4219) in 
  let val y_1899_3118_4227 = (internal_copy_Blog x_1892_3111_4220) in 
  let val y_1900_3119_4228 = (internal_copy_BlogContent x_1893_3112_4221) in 
  let val y_1901_3120_4229 = (internal_copy_BlogHeader x_1894_3113_4222) in 
  let val y_1902_3121_4230 = (internal_copy_BlogId x_1895_3114_4223) in 
  let val y_1903_3122_4231 = (internal_copy_BlogAuthor x_1896_3115_4224) in 
  let val y_1904_3123_4232 = (internal_copy_BlogDate x_1897_3116_4225) in (Layout3 (y_1898_3117_4226 , y_1899_3118_4227, y_1900_3119_4228, y_1901_3120_4229, y_1902_3121_4230, y_1903_3122_4231, y_1904_3123_4232)) end end end end end end end
  | Layout4 (x_1905_3124_4233 , x_1906_3125_4234, x_1907_3126_4235, x_1908_3127_4236, x_1909_3128_4237, x_1910_3129_4238, x_1911_3130_4239) => 
  let val y_1912_3131_4240 = (internal_copy_BlogTags x_1905_3124_4233) in 
  let val y_1913_3132_4241 = (internal_copy_BlogContent x_1906_3125_4234) in 
  let val y_1914_3133_4242 = (internal_copy_Blog x_1907_3126_4235) in 
  let val y_1915_3134_4243 = (internal_copy_BlogHeader x_1908_3127_4236) in 
  let val y_1916_3135_4244 = (internal_copy_BlogId x_1909_3128_4237) in 
  let val y_1917_3136_4245 = (internal_copy_BlogAuthor x_1910_3129_4238) in 
  let val y_1918_3137_4246 = (internal_copy_BlogDate x_1911_3130_4239) in (Layout4 (y_1912_3131_4240 , y_1913_3132_4241, y_1914_3133_4242, y_1915_3134_4243, y_1916_3135_4244, y_1917_3136_4245, y_1918_3137_4246)) end end end end end end end
  | Layout5 (x_1919_3138_4247 , x_1920_3139_4248, x_1921_3140_4249, x_1922_3141_4250, x_1923_3142_4251, x_1924_3143_4252, x_1925_3144_4253) => 
  let val y_1926_3145_4254 = (internal_copy_Blog x_1919_3138_4247) in 
  let val y_1927_3146_4255 = (internal_copy_BlogTags x_1920_3139_4248) in 
  let val y_1928_3147_4256 = (internal_copy_BlogContent x_1921_3140_4249) in 
  let val y_1929_3148_4257 = (internal_copy_BlogHeader x_1922_3141_4250) in 
  let val y_1930_3149_4258 = (internal_copy_BlogId x_1923_3142_4251) in 
  let val y_1931_3150_4259 = (internal_copy_BlogAuthor x_1924_3143_4252) in 
  let val y_1932_3151_4260 = (internal_copy_BlogDate x_1925_3144_4253) in (Layout5 (y_1926_3145_4254 , y_1927_3146_4255, y_1928_3147_4256, y_1929_3148_4257, y_1930_3149_4258, y_1931_3150_4259, y_1932_3151_4260)) end end end end end end end
  | Layout6 (x_1933_3152_4261 , x_1934_3153_4262, x_1935_3154_4263, x_1936_3155_4264, x_1937_3156_4265, x_1938_3157_4266, x_1939_3158_4267) => 
  let val y_1940_3159_4268 = (internal_copy_BlogHeader x_1933_3152_4261) in 
  let val y_1941_3160_4269 = (internal_copy_BlogId x_1934_3153_4262) in 
  let val y_1942_3161_4270 = (internal_copy_BlogAuthor x_1935_3154_4263) in 
  let val y_1943_3162_4271 = (internal_copy_BlogDate x_1936_3155_4264) in 
  let val y_1944_3163_4272 = (internal_copy_BlogContent x_1937_3156_4265) in 
  let val y_1945_3164_4273 = (internal_copy_Blog x_1938_3157_4266) in 
  let val y_1946_3165_4274 = (internal_copy_BlogTags x_1939_3158_4267) in (Layout6 (y_1940_3159_4268 , y_1941_3160_4269, y_1942_3161_4270, y_1943_3162_4271, y_1944_3163_4272, y_1945_3164_4273, y_1946_3165_4274)) end end end end end end end
  | Layout7 (x_1947_3166_4275 , x_1948_3167_4276, x_1949_3168_4277, x_1950_3169_4278, x_1951_3170_4279, x_1952_3171_4280, x_1953_3172_4281) => 
  let val y_1954_3173_4282 = (internal_copy_Blog x_1947_3166_4275) in 
  let val y_1955_3174_4283 = (internal_copy_BlogContent x_1948_3167_4276) in 
  let val y_1956_3175_4284 = (internal_copy_BlogHeader x_1949_3168_4277) in 
  let val y_1957_3176_4285 = (internal_copy_BlogId x_1950_3169_4278) in 
  let val y_1958_3177_4286 = (internal_copy_BlogAuthor x_1951_3170_4279) in 
  let val y_1959_3178_4287 = (internal_copy_BlogDate x_1952_3171_4280) in 
  let val y_1960_3179_4288 = (internal_copy_BlogTags x_1953_3172_4281) in (Layout7 (y_1954_3173_4282 , y_1955_3174_4283, y_1956_3175_4284, y_1957_3176_4285, y_1958_3177_4286, y_1959_3178_4287, y_1960_3179_4288)) end end end end end end end
  | Layout8 (x_1961_3180_4289 , x_1962_3181_4290, x_1963_3182_4291, x_1964_3183_4292, x_1965_3184_4293, x_1966_3185_4294, x_1967_3186_4295) => 
  let val y_1968_3187_4296 = (internal_copy_BlogContent x_1961_3180_4289) in 
  let val y_1969_3188_4297 = (internal_copy_Blog x_1962_3181_4290) in 
  let val y_1970_3189_4298 = (internal_copy_BlogId x_1963_3182_4291) in 
  let val y_1971_3190_4299 = (internal_copy_BlogAuthor x_1964_3183_4292) in 
  let val y_1972_3191_4300 = (internal_copy_BlogDate x_1965_3184_4293) in 
  let val y_1973_3192_4301 = (internal_copy_BlogHeader x_1966_3185_4294) in 
  let val y_1974_3193_4302 = (internal_copy_BlogTags x_1967_3186_4295) in (Layout8 (y_1968_3187_4296 , y_1969_3188_4297, y_1970_3189_4298, y_1971_3190_4299, y_1972_3191_4300, y_1973_3192_4301, y_1974_3193_4302)) end end end end end end end);

fun internal_copy_PList_v_1067 (arg_2440_3658_4767) = (case arg_2440_3658_4767 of Nil_v_1067 => Nil_v_1067 
  | Cons_v_1067 (x_2441_3659_4768 , x_2442_3660_4769) => 
  let val y_2443_3661_4770 = (internal_copy_Block x_2441_3659_4768) in 
  let val y_2444_3662_4771 = (internal_copy_PList_v_1067 x_2442_3660_4769) in (Cons_v_1067 (y_2443_3661_4770 , y_2444_3662_4771)) end end);

fun maxInt (a_393_2784_4050 , b_394_2785_4051) = 
  let val fltIf_3854_4052 = (a_393_2784_4050 > b_394_2785_4051) in 
  (if fltIf_3854_4052 then a_393_2784_4050 
   else b_394_2785_4051) end;

fun cmp (start_313_2736_4019 , end_314_2737_4020, word1_315_2738_4021, word2_316_2739_4022) = 
  let val fltIf_3848_4023 = (start_313_2736_4019 < end_314_2737_4020) in 
  (if fltIf_3848_4023 then 
  let val a_317_2740_4026 = (CharArraySlice.sub(word1_315_2738_4021 , start_313_2736_4019)) in 
  let val b_318_2741_4029 = (CharArraySlice.sub(word2_316_2739_4022 , start_313_2736_4019)) in 
  let val fltIf_3849_4030 = (a_317_2740_4026 = b_318_2741_4029) in 
  let val eq_319_2742_4031 = 
  (if fltIf_3849_4030 then true 
   else false) in 
  let val fltAppE_3850_4032 = (start_313_2736_4019 + 1) in 
  let val recurse_320_2743_4033 = (cmp(fltAppE_3850_4032 , end_314_2737_4020, word1_315_2738_4021, word2_316_2739_4022)) in (eq_319_2742_4031 andalso recurse_320_2743_4033) end end end end end end 
   else true) end;

fun compareWord (word1_321_2744_4034 , word2_322_2745_4035) = 
  let val len1_323_2746_4037 = (CharArraySlice.length word1_321_2744_4034) in 
  let val len2_324_2747_4039 = (CharArraySlice.length word2_322_2745_4035) in 
  let val fltIf_3851_4040 = (len1_323_2746_4037 = len2_324_2747_4039) in 
  let val compare_len_325_2748_4041 = 
  (if fltIf_3851_4040 then true 
   else false) in 
  (if compare_len_325_2748_4041 then (cmp(0 , len1_323_2746_4037, word1_321_2744_4034, word2_322_2745_4035)) 
   else false) end end end end;

fun emphasizeInlineListForKeyword (keyword_274_2697_4004 , inline_list_275_2698_4005) = (case inline_list_275_2698_4005 of Nil_v_1064 => Nil_v_1064 
  | Cons_v_1064 (inline_276_2699_4006 , rst_277_2700_4007) => 
  let val newinline_278_2701_4008 = (emphasizeKeywordInline(keyword_274_2697_4004 , inline_276_2699_4006)) in 
  let val rst__279_2702_4009 = (emphasizeInlineListForKeyword(keyword_274_2697_4004 , rst_277_2700_4007)) in (Cons_v_1064 (newinline_278_2701_4008 , rst__279_2702_4009)) end end)
and emphasizeKeywordInline (keyword_280_2703_4010 , inline_281_2704_4011) = (case inline_281_2704_4011 of Str (text_282_2705_4012) => 
  let val isSame_283_2706_4013 = (compareWord(keyword_280_2703_4010 , text_282_2705_4012)) in 
  (if isSame_283_2706_4013 then 
  let val fltPkd_3845_4014 = (internal_copy_Inline inline_281_2704_4011) in 
  let val fltPkd_3846_4015 = Nil_v_1064 in 
  let val newlist_284_2707_4016 = (Cons_v_1064 (fltPkd_3845_4014 , fltPkd_3846_4015)) in (Emph (newlist_284_2707_4016)) end end end 
   else inline_281_2704_4011) end 
  | Emph (list_inline_285_2708_4017) => 
  let val fltPkd_3847_4018 = (emphasizeInlineListForKeyword(keyword_280_2703_4010 , list_inline_285_2708_4017)) in (Emph (fltPkd_3847_4018)) end
  | Space => Space);

fun mkSomeTags (len_188_2631_3991) = 
  let val fltIf_3840_3992 = (len_188_2631_3991 <= 0) in 
  (if fltIf_3840_3992 then Nil_v_1065 
   else 
  let val vec_220_189_2632_3993 = ((fn internal__ =>
  CharArraySlice.full(CharArray.array(internal__, #"0"))) 1) in 
  let val internal__190_2633_3994 = let val _ =
  (CharArraySlice.update(vec_220_189_2632_3993 , 0, #"a")) in vec_220_189_2632_3993 end in 
  let val fltAppE_3841_3996 = (len_188_2631_3991 - 1) in 
  let val rst_192_2635_3997 = (mkSomeTags fltAppE_3841_3996) in (Cons_v_1065 (vec_220_189_2632_3993 , rst_192_2635_3997)) end end end end) end;

fun getChar (decimal_107_2555_3965) = 
  let val fltIf_3815_3966 = (decimal_107_2555_3965 = 0) in 
  (if fltIf_3815_3966 then #"a" 
   else 
  let val fltIf_3816_3967 = (decimal_107_2555_3965 = 1) in 
  (if fltIf_3816_3967 then #"b" 
   else 
  let val fltIf_3817_3968 = (decimal_107_2555_3965 = 2) in 
  (if fltIf_3817_3968 then #"c" 
   else 
  let val fltIf_3818_3969 = (decimal_107_2555_3965 = 3) in 
  (if fltIf_3818_3969 then #"d" 
   else 
  let val fltIf_3819_3970 = (decimal_107_2555_3965 = 4) in 
  (if fltIf_3819_3970 then #"e" 
   else 
  let val fltIf_3820_3971 = (decimal_107_2555_3965 = 5) in 
  (if fltIf_3820_3971 then #"f" 
   else 
  let val fltIf_3821_3972 = (decimal_107_2555_3965 = 6) in 
  (if fltIf_3821_3972 then #"g" 
   else 
  let val fltIf_3822_3973 = (decimal_107_2555_3965 = 7) in 
  (if fltIf_3822_3973 then #"h" 
   else 
  let val fltIf_3823_3974 = (decimal_107_2555_3965 = 8) in 
  (if fltIf_3823_3974 then #"i" 
   else 
  let val fltIf_3824_3975 = (decimal_107_2555_3965 = 9) in 
  (if fltIf_3824_3975 then #"j" 
   else 
  let val fltIf_3825_3976 = (decimal_107_2555_3965 = 10) in 
  (if fltIf_3825_3976 then #"k" 
   else 
  let val fltIf_3826_3977 = (decimal_107_2555_3965 = 11) in 
  (if fltIf_3826_3977 then #"l" 
   else 
  let val fltIf_3827_3978 = (decimal_107_2555_3965 = 12) in 
  (if fltIf_3827_3978 then #"m" 
   else 
  let val fltIf_3828_3979 = (decimal_107_2555_3965 = 13) in 
  (if fltIf_3828_3979 then #"n" 
   else 
  let val fltIf_3829_3980 = (decimal_107_2555_3965 = 14) in 
  (if fltIf_3829_3980 then #"o" 
   else 
  let val fltIf_3830_3981 = (decimal_107_2555_3965 = 15) in 
  (if fltIf_3830_3981 then #"p" 
   else 
  let val fltIf_3831_3982 = (decimal_107_2555_3965 = 16) in 
  (if fltIf_3831_3982 then #"q" 
   else 
  let val fltIf_3832_3983 = (decimal_107_2555_3965 = 17) in 
  (if fltIf_3832_3983 then #"r" 
   else 
  let val fltIf_3833_3984 = (decimal_107_2555_3965 = 18) in 
  (if fltIf_3833_3984 then #"s" 
   else 
  let val fltIf_3834_3985 = (decimal_107_2555_3965 = 19) in 
  (if fltIf_3834_3985 then #"t" 
   else 
  let val fltIf_3835_3986 = (decimal_107_2555_3965 = 20) in 
  (if fltIf_3835_3986 then #"u" 
   else 
  let val fltIf_3836_3987 = (decimal_107_2555_3965 = 21) in 
  (if fltIf_3836_3987 then #"v" 
   else 
  let val fltIf_3837_3988 = (decimal_107_2555_3965 = 22) in 
  (if fltIf_3837_3988 then #"w" 
   else 
  let val fltIf_3838_3989 = (decimal_107_2555_3965 = 23) in 
  (if fltIf_3838_3989 then #"x" 
   else 
  let val fltIf_3839_3990 = (decimal_107_2555_3965 = 24) in 
  (if fltIf_3839_3990 then #"y" 
   else #"z") end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end;

fun mkChar (val_360_2783_4047) = 
  let val fltPrm_3853_4048 = (Word.toInt (MLton.Random.rand())) in 
  let val fltAppE_3852_4049 = (fltPrm_3853_4048 mod 26) in (getChar fltAppE_3852_4049) end end;

fun generate_loop_1077_1562 (vec_616_2941_4053 , idx_617_2942_4054, end_618_2943_4055) = 
  let val fltIf_3855_4056 = (idx_617_2942_4054 = end_618_2943_4055) in 
  (if fltIf_3855_4056 then vec_616_2941_4053 
   else 
  let val fltPrm_3856_4057 = (mkChar idx_617_2942_4054) in 
  let val vec1_621_2944_4058 = let val _ = (CharArraySlice.update(vec_616_2941_4053 , idx_617_2942_4054, fltPrm_3856_4057)) in vec_616_2941_4053 end in 
  let val fltAppE_3857_4059 = (idx_617_2942_4054 + 1) in (generate_loop_1077_1562(vec1_621_2944_4058 , fltAppE_3857_4059, end_618_2943_4055)) end end end) end;

fun getRandomString (length_359_2782_4042) = 
  let val n__364_2938_3732_4044 = 0 in 
  let val vec_365_2939_3733_4045 = ((fn internal__ =>
  CharArraySlice.full(CharArray.array(internal__, #"0"))) length_359_2782_4042) in 
  let val vec1_366_2940_3734_4046 = (generate_loop_1077_1562(vec_365_2939_3733_4045 , 0, n__364_2938_3732_4044)) in vec1_366_2940_3734_4046 end end end;

fun mkRandomInlineList (len_193_2636_3998) = 
  let val fltIf_3842_3999 = (len_193_2636_3998 <= 0) in 
  (if fltIf_3842_3999 then Nil_v_1064 
   else 
  let val fltPkd_3843_4000 = (getRandomString 5) in 
  let val word_194_2637_4001 = (Str (fltPkd_3843_4000)) in 
  let val fltAppE_3844_4002 = (len_193_2636_3998 - 1) in 
  let val rst_195_2638_4003 = (mkRandomInlineList fltAppE_3844_4002) in (Cons_v_1064 (word_194_2637_4001 , rst_195_2638_4003)) end end end end) end;

fun mkBlogs_layout4 (length_97_2545_3945 , contlen_98_2546_3946, taglen_99_2547_3947) = 
  let val fltIf_3805_3948 = (length_97_2545_3945 <= 0) in 
  (if fltIf_3805_3948 then End 
   else 
  let val fltPkd_3806_3949 = (mkSomeTags taglen_99_2547_3947) in 
  let val tags_100_2548_3950 = (TagList (fltPkd_3806_3949)) in 
  let val fltPkd_3808_3951 = (mkRandomInlineList contlen_98_2546_3946) in 
  let val fltPkd_3807_3952 = (Plain (fltPkd_3808_3951)) in 
  let val content_101_2549_3953 = (Content (fltPkd_3807_3952)) in 
  let val fltAppE_3809_3954 = (length_97_2545_3945 - 1) in 
  let val rst_102_2550_3955 = (mkBlogs_layout4(fltAppE_3809_3954 , contlen_98_2546_3946, taglen_99_2547_3947)) in 
  let val fltPkd_3810_3956 = (getRandomString 5) in 
  let val header_103_2551_3957 = (Header (fltPkd_3810_3956)) in 
  let val fltPrm_3812_3958 = (length_97_2545_3945 mod 10) in 
  let val fltPkd_3811_3959 = (10 - fltPrm_3812_3958) in 
  let val id_104_2552_3960 = (ID (fltPkd_3811_3959)) in 
  let val fltPkd_3813_3961 = (getRandomString 5) in 
  let val author_105_2553_3962 = (Author (fltPkd_3813_3961)) in 
  let val fltPkd_3814_3963 = (getRandomString 5) in 
  let val date_106_2554_3964 = (Date (fltPkd_3814_3963)) in (Layout4 (tags_100_2548_3950 , content_101_2549_3953, rst_102_2550_3955, header_103_2551_3957, id_104_2552_3960, author_105_2553_3962, date_106_2554_3964)) end end end end end end end end end end end end end end end end) end;

fun blogLength (blog_40_2488_3880) = (case blog_40_2488_3880 of End => 0 
  | Layout1 (a_41_2489_3881 , b_42_2490_3882, c_43_2491_3883, d_44_2492_3884, e_45_2493_3885, f_46_2494_3886, rst_47_2495_3887) => 
  let val fltPrm_3797_3888 = (blogLength rst_47_2495_3887) in (1 + fltPrm_3797_3888) end
  | Layout2 (a_48_2496_3889 , b_49_2497_3890, rst_50_2498_3891, c_51_2499_3892, d_52_2500_3893, e_53_2501_3894, f_54_2502_3895) => 
  let val fltPrm_3798_3896 = (blogLength rst_50_2498_3891) in (1 + fltPrm_3798_3896) end
  | Layout3 (a_55_2503_3897 , rst_56_2504_3898, b_57_2505_3899, c_58_2506_3900, d_59_2507_3901, e_60_2508_3902, f_61_2509_3903) => 
  let val fltPrm_3799_3904 = (blogLength rst_56_2504_3898) in (1 + fltPrm_3799_3904) end
  | Layout4 (a_62_2510_3905 , b_63_2511_3906, rst_64_2512_3907, d_65_2513_3908, e_66_2514_3909, f_67_2515_3910, g_68_2516_3911) => 
  let val fltPrm_3800_3912 = (blogLength rst_64_2512_3907) in (1 + fltPrm_3800_3912) end
  | Layout5 (rst_69_2517_3913 , a_70_2518_3914, b_71_2519_3915, c_72_2520_3916, d_73_2521_3917, e_74_2522_3918, f_75_2523_3919) => 
  let val fltPrm_3801_3920 = (blogLength rst_69_2517_3913) in (1 + fltPrm_3801_3920) end
  | Layout6 (a_76_2524_3921 , b_77_2525_3922, c_78_2526_3923, d_79_2527_3924, e_80_2528_3925, rst_81_2529_3926, f_82_2530_3927) => 
  let val fltPrm_3802_3928 = (blogLength rst_81_2529_3926) in (1 + fltPrm_3802_3928) end
  | Layout7 (rst_83_2531_3929 , a_84_2532_3930, b_85_2533_3931, c_86_2534_3932, d_87_2535_3933, e_88_2536_3934, f_89_2537_3935) => 
  let val fltPrm_3803_3936 = (blogLength rst_83_2531_3929) in (1 + fltPrm_3803_3936) end
  | Layout8 (a_90_2538_3937 , rst_91_2539_3938, b_92_2540_3939, c_93_2541_3940, d_94_2542_3941, e_95_2543_3942, f_96_2544_3943) => 
  let val fltPrm_3804_3944 = (blogLength rst_91_2539_3938) in (1 + fltPrm_3804_3944) end);

fun emphasizeKeywordInBlock (keyword_37_2485_3876 , contentBlock_38_2486_3877) = (case contentBlock_38_2486_3877 of Plain (list_inline_39_2487_3878) => 
  let val fltPkd_3796_3879 = (emphasizeInlineListForKeyword(keyword_37_2485_3876 , list_inline_39_2487_3878)) in (Plain (fltPkd_3796_3879)) end 
  | Null => Null);

fun caseFn_2466 (keyword_25_2467_3684_4793 , content_28_2468_3685_4794) = (case content_28_2468_3685_4794 of Content (block_34_3686_4795) => 
  let val fltPkd_3858_4796 = (emphasizeKeywordInBlock(keyword_25_2467_3684_4793 , block_34_3686_4795)) in (Content (fltPkd_3858_4796)) end);

fun emphKeywordInContent (keyword_25_2474_3865 , blogs_26_2475_3866) = (case blogs_26_2475_3866 of End => End
  | Layout1 (a, b, c, d, e, f, g) => Layout1 (a, b, c, d, e, f, g)
  | Layout2 (a, b, c, d, e, f, g) => Layout2 (a, b, c, d, e, f, g)
  | Layout3 (a, b, c, d, e, f, g) => Layout3 (a, b, c, d, e, f, g)
  | Layout5 (a, b, c, d, e, f, g) => Layout5 (a, b, c, d, e, f, g)
  | Layout6 (a, b, c, d, e, f, g) => Layout6 (a, b, c, d, e, f, g)
  | Layout7 (a, b, c, d, e, f, g) => Layout7 (a, b, c, d, e, f, g)
  | Layout8 (a, b, c, d, e, f, g) => Layout8 (a, b, c, d, e, f, g)
  | Layout4 (tags_27_2476_3867 , content_28_2477_3868, rst_29_2478_3869, header_30_2479_3870, id_31_2480_3871, author_32_2481_3872, date_33_2482_3873) => 
  let val newContent_35_2483_3874 = (caseFn_2466(keyword_25_2474_3865 , content_28_2477_3868)) in 
  let val newRst_36_2484_3875 = (emphKeywordInContent(keyword_25_2474_3865 , rst_29_2478_3869)) in (Layout4 (tags_27_2476_3867 , newContent_35_2483_3874, newRst_36_2484_3875, header_30_2479_3870, id_31_2480_3871, author_32_2481_3872, date_33_2482_3873)) end end);

val _ = ((fn true => print "True" | false => print "False") 
  let val blogs_19_2469_3859 = (mkBlogs_layout4(1000000 , 100, 10)) in 
  let val vec_16_20_2470_3860 = ((fn internal__ => CharArraySlice.full(CharArray.array(internal__, #"0"))) 1) in 
  let val internal__21_2471_3861 = let val _ = (CharArraySlice.update(vec_16_20_2470_3860 , 0, #"a")) in vec_16_20_2470_3860 end in 
  let val start = Time.toNanoseconds(Time.now()) in
  let val newblgs_23_2473_3863 = (emphKeywordInContent(vec_16_20_2470_3860 , blogs_19_2469_3859)) in
  let val stop = Time.toNanoseconds(Time.now()) in
  let val execTime = stop - start in
  let val _ = print "ExecTime (ns): " in
  let val _ = print (LargeInt.toString execTime) in
  let val _ = print "\n" in
  let val fltPrm_3795_3864 = (blogLength newblgs_23_2473_3863) in (fltPrm_3795_3864 = 1000000) end end end end end end end end end end end);
val _ = print "\n"
