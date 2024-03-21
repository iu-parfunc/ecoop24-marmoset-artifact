datatype dat_Inline = Str of (CharArraySlice.slice) | Emph of ( dat_PList_v_1065)| Space 
and dat_Block = Plain of ( dat_PList_v_1065) | Null
and dat_BlogHeader = Header of (CharArraySlice.slice)
and dat_BlogId = ID of (int)
and dat_BlogAuthor = Author of (CharArraySlice.slice)
and dat_BlogDate = Date of (CharArraySlice.slice)
and dat_BlogContent = Content of ( dat_Block)
and dat_BlogTags = TagList of ( dat_PList_v_1066)
and dat_Blog = End | Layout1 of ( dat_BlogHeader  *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogContent *  dat_BlogTags *  dat_Blog)| Layout2 of ( dat_BlogContent  *  dat_BlogTags *  dat_Blog *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout3 of ( dat_BlogTags  *  dat_Blog *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout4 of ( dat_BlogTags  *  dat_BlogContent *  dat_Blog *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout5 of ( dat_Blog  *  dat_BlogTags *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout6 of ( dat_BlogHeader  *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogContent *  dat_Blog *  dat_BlogTags)| Layout7 of ( dat_Blog  *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogTags)| Layout8 of ( dat_BlogContent  *  dat_Blog *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogHeader *  dat_BlogTags)
and dat_PList_v_1066 = Nil_v_1066 | Cons_v_1066 of (CharArraySlice.slice  *  dat_PList_v_1066)
and dat_PList_v_1065 = Nil_v_1065 | Cons_v_1065 of ( dat_Inline  *  dat_PList_v_1065)
and dat_PList_v_1068 = Nil_v_1068 | Cons_v_1068 of ( dat_Block  *  dat_PList_v_1068) ;

fun internal_print_PList_v_1066 (arg_2410_3626_4750) = (case arg_2410_3626_4750 of Nil_v_1066 => 
  let val wildcard_2411_3627_4751 = (print "(Nil_v_1066") in 
  let val wildcard_2412_3628_4752 = (print ")") in () end end 
  | Cons_v_1066 (x_2413_3629_4753 , x_2414_3630_4754) => 
  let val wildcard_2417_3631_4755 = (print "(Cons_v_1066") in 
  let val wildcard_2420_3632_4756 = (print " ") in 
  let val y_2415_3633_4757 = (print "Vector") in 
  let val wildcard_2419_3634_4758 = (print " ") in 
  let val y_2416_3635_4759 = (internal_print_PList_v_1066 x_2414_3630_4754) in 
  let val wildcard_2418_3636_4760 = (print ")") in () end end end end end end);

fun internal_traverse_PList_v_1066 (arg_2405_3622_4746) = (case arg_2405_3622_4746 of Nil_v_1066 => () 
  | Cons_v_1066 (x_2406_3623_4747 , x_2407_3624_4748) => 
  let val y_2409_3625_4749 = (internal_traverse_PList_v_1066 x_2407_3624_4748) in () end);

fun internal_copy_without_ptrs_PList_v_1066 (arg_2400_3617_4741) = (case arg_2400_3617_4741 of Nil_v_1066 => Nil_v_1066 
  | Cons_v_1066 (x_2401_3618_4742 , x_2402_3619_4743) => 
  let val y_2404_3621_4745 = (internal_copy_without_ptrs_PList_v_1066 x_2402_3619_4743) in (Cons_v_1066 (x_2401_3618_4742 , y_2404_3621_4745)) end);

fun internal_copy_PList_v_1066 (arg_2395_3612_4736) = (case arg_2395_3612_4736 of Nil_v_1066 => Nil_v_1066 
  | Cons_v_1066 (x_2396_3613_4737 , x_2397_3614_4738) => 
  let val y_2399_3616_4740 = (internal_copy_PList_v_1066 x_2397_3614_4738) in (Cons_v_1066 (x_2396_3613_4737 , y_2399_3616_4740)) end);

fun internal_print_BlogTags (arg_1863_3080_4204) = (case arg_1863_3080_4204 of TagList (x_1864_3081_4205) => 
  let val wildcard_1866_3082_4206 = (print "(TagList") in 
  let val wildcard_1868_3083_4207 = (print " ") in 
  let val y_1865_3084_4208 = (internal_print_PList_v_1066 x_1864_3081_4205) in 
  let val wildcard_1867_3085_4209 = (print ")") in () end end end end);

fun internal_traverse_BlogTags (arg_1860_3077_4201) = (case arg_1860_3077_4201 of TagList (x_1861_3078_4202) => 
  let val y_1862_3079_4203 = (internal_traverse_PList_v_1066 x_1861_3078_4202) in () end);

fun internal_copy_without_ptrs_BlogTags (arg_1857_3074_4198) = (case arg_1857_3074_4198 of TagList (x_1858_3075_4199) => 
  let val y_1859_3076_4200 = (internal_copy_without_ptrs_PList_v_1066 x_1858_3075_4199) in (TagList (y_1859_3076_4200)) end);

fun internal_copy_BlogTags (arg_1854_3071_4195) = (case arg_1854_3071_4195 of TagList (x_1855_3072_4196) => 
  let val y_1856_3073_4197 = (internal_copy_PList_v_1066 x_1855_3072_4196) in (TagList (y_1856_3073_4197)) end);

fun internal_print_BlogDate (arg_1833_3050_4174) = (case arg_1833_3050_4174 of Date (x_1834_3051_4175) => 
  let val wildcard_1836_3052_4176 = (print "(Date") in 
  let val wildcard_1838_3053_4177 = (print " ") in 
  let val y_1835_3054_4178 = (print "Vector") in 
  let val wildcard_1837_3055_4179 = (print ")") in () end end end end);

fun internal_traverse_BlogDate (arg_1830_3048_4172) = (case arg_1830_3048_4172 of Date (x_1831_3049_4173) => ());

fun internal_copy_without_ptrs_BlogDate (arg_1827_3045_4169) = (case arg_1827_3045_4169 of Date (x_1828_3046_4170) => (Date (x_1828_3046_4170)));

fun internal_copy_BlogDate (arg_1824_3042_4166) = (case arg_1824_3042_4166 of Date (x_1825_3043_4167) => (Date (x_1825_3043_4167)));

fun internal_print_BlogAuthor (arg_1818_3036_4160) = (case arg_1818_3036_4160 of Author (x_1819_3037_4161) => 
  let val wildcard_1821_3038_4162 = (print "(Author") in 
  let val wildcard_1823_3039_4163 = (print " ") in 
  let val y_1820_3040_4164 = (print "Vector") in 
  let val wildcard_1822_3041_4165 = (print ")") in () end end end end);

fun internal_traverse_BlogAuthor (arg_1815_3034_4158) = (case arg_1815_3034_4158 of Author (x_1816_3035_4159) => ());

fun internal_copy_without_ptrs_BlogAuthor (arg_1812_3031_4155) = (case arg_1812_3031_4155 of Author (x_1813_3032_4156) => (Author (x_1813_3032_4156)));

fun internal_copy_BlogAuthor (arg_1809_3028_4152) = (case arg_1809_3028_4152 of Author (x_1810_3029_4153) => (Author (x_1810_3029_4153)));

fun internal_print_BlogId (arg_1803_3022_4146) = (case arg_1803_3022_4146 of ID (x_1804_3023_4147) => 
  let val wildcard_1806_3024_4148 = (print "(ID") in 
  let val wildcard_1808_3025_4149 = (print " ") in 
  let val y_1805_3026_4150 = (print(Int.toString(x_1804_3023_4147))) in 
  let val wildcard_1807_3027_4151 = (print ")") in () end end end end);

fun internal_traverse_BlogId (arg_1800_3020_4144) = (case arg_1800_3020_4144 of ID (x_1801_3021_4145) => ());

fun internal_copy_without_ptrs_BlogId (arg_1797_3017_4141) = (case arg_1797_3017_4141 of ID (x_1798_3018_4142) => (ID (x_1798_3018_4142)));

fun internal_copy_BlogId (arg_1794_3014_4138) = (case arg_1794_3014_4138 of ID (x_1795_3015_4139) => (ID (x_1795_3015_4139)));

fun internal_print_BlogHeader (arg_1788_3008_4132) = (case arg_1788_3008_4132 of Header (x_1789_3009_4133) => 
  let val wildcard_1791_3010_4134 = (print "(Header") in 
  let val wildcard_1793_3011_4135 = (print " ") in 
  let val y_1790_3012_4136 = (print "Vector") in 
  let val wildcard_1792_3013_4137 = (print ")") in () end end end end);

fun internal_traverse_BlogHeader (arg_1785_3006_4130) = (case arg_1785_3006_4130 of Header (x_1786_3007_4131) => ());

fun internal_copy_without_ptrs_BlogHeader (arg_1782_3003_4127) = (case arg_1782_3003_4127 of Header (x_1783_3004_4128) => (Header (x_1783_3004_4128)));

fun internal_copy_BlogHeader (arg_1779_3000_4124) = (case arg_1779_3000_4124 of Header (x_1780_3001_4125) => (Header (x_1780_3001_4125)));

fun internal_print_Inline (arg_1749_2970_4094) = (case arg_1749_2970_4094 of Str (x_1750_2971_4095) => 
  let val wildcard_1752_2972_4096 = (print "(Str") in 
  let val wildcard_1754_2973_4097 = (print " ") in 
  let val y_1751_2974_4098 = (print "Vector") in 
  let val wildcard_1753_2975_4099 = (print ")") in () end end end end 
  | Emph (x_1755_2976_4100) => 
  let val wildcard_1757_2977_4101 = (print "(Emph") in 
  let val wildcard_1759_2978_4102 = (print " ") in 
  let val y_1756_2979_4103 = (internal_print_PList_v_1065 x_1755_2976_4100) in 
  let val wildcard_1758_2980_4104 = (print ")") in () end end end end
  | Space => 
  let val wildcard_1760_2981_4105 = (print "(Space") in 
  let val wildcard_1761_2982_4106 = (print ")") in () end end)
and internal_print_PList_v_1065 (arg_2436_3652_4776) = (case arg_2436_3652_4776 of Nil_v_1065 => 
  let val wildcard_2437_3653_4777 = (print "(Nil_v_1065") in 
  let val wildcard_2438_3654_4778 = (print ")") in () end end 
  | Cons_v_1065 (x_2439_3655_4779 , x_2440_3656_4780) => 
  let val wildcard_2443_3657_4781 = (print "(Cons_v_1065") in 
  let val wildcard_2446_3658_4782 = (print " ") in 
  let val y_2441_3659_4783 = (internal_print_Inline x_2439_3655_4779) in 
  let val wildcard_2445_3660_4784 = (print " ") in 
  let val y_2442_3661_4785 = (internal_print_PList_v_1065 x_2440_3656_4780) in 
  let val wildcard_2444_3662_4786 = (print ")") in () end end end end end end);

fun internal_print_Block (arg_1771_2992_4116) = (case arg_1771_2992_4116 of Plain (x_1772_2993_4117) => 
  let val wildcard_1774_2994_4118 = (print "(Plain") in 
  let val wildcard_1776_2995_4119 = (print " ") in 
  let val y_1773_2996_4120 = (internal_print_PList_v_1065 x_1772_2993_4117) in 
  let val wildcard_1775_2997_4121 = (print ")") in () end end end end 
  | Null => 
  let val wildcard_1777_2998_4122 = (print "(Null") in 
  let val wildcard_1778_2999_4123 = (print ")") in () end end);

fun internal_print_BlogContent (arg_1848_3065_4189) = (case arg_1848_3065_4189 of Content (x_1849_3066_4190) => 
  let val wildcard_1851_3067_4191 = (print "(Content") in 
  let val wildcard_1853_3068_4192 = (print " ") in 
  let val y_1850_3069_4193 = (internal_print_Block x_1849_3066_4190) in 
  let val wildcard_1852_3070_4194 = (print ")") in () end end end end);

fun internal_print_Blog (arg_2208_3425_4549) = (case arg_2208_3425_4549 of End => 
  let val wildcard_2209_3426_4550 = (print "(End") in 
  let val wildcard_2210_3427_4551 = (print ")") in () end end 
  | Layout1 (x_2211_3428_4552 , x_2212_3429_4553, x_2213_3430_4554, x_2214_3431_4555, x_2215_3432_4556, x_2216_3433_4557, x_2217_3434_4558) => 
  let val wildcard_2225_3435_4559 = (print "(Layout1") in 
  let val wildcard_2233_3436_4560 = (print " ") in 
  let val y_2218_3437_4561 = (internal_print_BlogHeader x_2211_3428_4552) in 
  let val wildcard_2232_3438_4562 = (print " ") in 
  let val y_2219_3439_4563 = (internal_print_BlogId x_2212_3429_4553) in 
  let val wildcard_2231_3440_4564 = (print " ") in 
  let val y_2220_3441_4565 = (internal_print_BlogAuthor x_2213_3430_4554) in 
  let val wildcard_2230_3442_4566 = (print " ") in 
  let val y_2221_3443_4567 = (internal_print_BlogDate x_2214_3431_4555) in 
  let val wildcard_2229_3444_4568 = (print " ") in 
  let val y_2222_3445_4569 = (internal_print_BlogContent x_2215_3432_4556) in 
  let val wildcard_2228_3446_4570 = (print " ") in 
  let val y_2223_3447_4571 = (internal_print_BlogTags x_2216_3433_4557) in 
  let val wildcard_2227_3448_4572 = (print " ") in 
  let val y_2224_3449_4573 = (internal_print_Blog x_2217_3434_4558) in 
  let val wildcard_2226_3450_4574 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout2 (x_2234_3451_4575 , x_2235_3452_4576, x_2236_3453_4577, x_2237_3454_4578, x_2238_3455_4579, x_2239_3456_4580, x_2240_3457_4581) => 
  let val wildcard_2248_3458_4582 = (print "(Layout2") in 
  let val wildcard_2256_3459_4583 = (print " ") in 
  let val y_2241_3460_4584 = (internal_print_BlogContent x_2234_3451_4575) in 
  let val wildcard_2255_3461_4585 = (print " ") in 
  let val y_2242_3462_4586 = (internal_print_BlogTags x_2235_3452_4576) in 
  let val wildcard_2254_3463_4587 = (print " ") in 
  let val y_2243_3464_4588 = (internal_print_Blog x_2236_3453_4577) in 
  let val wildcard_2253_3465_4589 = (print " ") in 
  let val y_2244_3466_4590 = (internal_print_BlogHeader x_2237_3454_4578) in 
  let val wildcard_2252_3467_4591 = (print " ") in 
  let val y_2245_3468_4592 = (internal_print_BlogId x_2238_3455_4579) in 
  let val wildcard_2251_3469_4593 = (print " ") in 
  let val y_2246_3470_4594 = (internal_print_BlogAuthor x_2239_3456_4580) in 
  let val wildcard_2250_3471_4595 = (print " ") in 
  let val y_2247_3472_4596 = (internal_print_BlogDate x_2240_3457_4581) in 
  let val wildcard_2249_3473_4597 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout3 (x_2257_3474_4598 , x_2258_3475_4599, x_2259_3476_4600, x_2260_3477_4601, x_2261_3478_4602, x_2262_3479_4603, x_2263_3480_4604) => 
  let val wildcard_2271_3481_4605 = (print "(Layout3") in 
  let val wildcard_2279_3482_4606 = (print " ") in 
  let val y_2264_3483_4607 = (internal_print_BlogTags x_2257_3474_4598) in 
  let val wildcard_2278_3484_4608 = (print " ") in 
  let val y_2265_3485_4609 = (internal_print_Blog x_2258_3475_4599) in 
  let val wildcard_2277_3486_4610 = (print " ") in 
  let val y_2266_3487_4611 = (internal_print_BlogContent x_2259_3476_4600) in 
  let val wildcard_2276_3488_4612 = (print " ") in 
  let val y_2267_3489_4613 = (internal_print_BlogHeader x_2260_3477_4601) in 
  let val wildcard_2275_3490_4614 = (print " ") in 
  let val y_2268_3491_4615 = (internal_print_BlogId x_2261_3478_4602) in 
  let val wildcard_2274_3492_4616 = (print " ") in 
  let val y_2269_3493_4617 = (internal_print_BlogAuthor x_2262_3479_4603) in 
  let val wildcard_2273_3494_4618 = (print " ") in 
  let val y_2270_3495_4619 = (internal_print_BlogDate x_2263_3480_4604) in 
  let val wildcard_2272_3496_4620 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout4 (x_2280_3497_4621 , x_2281_3498_4622, x_2282_3499_4623, x_2283_3500_4624, x_2284_3501_4625, x_2285_3502_4626, x_2286_3503_4627) => 
  let val wildcard_2294_3504_4628 = (print "(Layout4") in 
  let val wildcard_2302_3505_4629 = (print " ") in 
  let val y_2287_3506_4630 = (internal_print_BlogTags x_2280_3497_4621) in 
  let val wildcard_2301_3507_4631 = (print " ") in 
  let val y_2288_3508_4632 = (internal_print_BlogContent x_2281_3498_4622) in 
  let val wildcard_2300_3509_4633 = (print " ") in 
  let val y_2289_3510_4634 = (internal_print_Blog x_2282_3499_4623) in 
  let val wildcard_2299_3511_4635 = (print " ") in 
  let val y_2290_3512_4636 = (internal_print_BlogHeader x_2283_3500_4624) in 
  let val wildcard_2298_3513_4637 = (print " ") in 
  let val y_2291_3514_4638 = (internal_print_BlogId x_2284_3501_4625) in 
  let val wildcard_2297_3515_4639 = (print " ") in 
  let val y_2292_3516_4640 = (internal_print_BlogAuthor x_2285_3502_4626) in 
  let val wildcard_2296_3517_4641 = (print " ") in 
  let val y_2293_3518_4642 = (internal_print_BlogDate x_2286_3503_4627) in 
  let val wildcard_2295_3519_4643 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout5 (x_2303_3520_4644 , x_2304_3521_4645, x_2305_3522_4646, x_2306_3523_4647, x_2307_3524_4648, x_2308_3525_4649, x_2309_3526_4650) => 
  let val wildcard_2317_3527_4651 = (print "(Layout5") in 
  let val wildcard_2325_3528_4652 = (print " ") in 
  let val y_2310_3529_4653 = (internal_print_Blog x_2303_3520_4644) in 
  let val wildcard_2324_3530_4654 = (print " ") in 
  let val y_2311_3531_4655 = (internal_print_BlogTags x_2304_3521_4645) in 
  let val wildcard_2323_3532_4656 = (print " ") in 
  let val y_2312_3533_4657 = (internal_print_BlogContent x_2305_3522_4646) in 
  let val wildcard_2322_3534_4658 = (print " ") in 
  let val y_2313_3535_4659 = (internal_print_BlogHeader x_2306_3523_4647) in 
  let val wildcard_2321_3536_4660 = (print " ") in 
  let val y_2314_3537_4661 = (internal_print_BlogId x_2307_3524_4648) in 
  let val wildcard_2320_3538_4662 = (print " ") in 
  let val y_2315_3539_4663 = (internal_print_BlogAuthor x_2308_3525_4649) in 
  let val wildcard_2319_3540_4664 = (print " ") in 
  let val y_2316_3541_4665 = (internal_print_BlogDate x_2309_3526_4650) in 
  let val wildcard_2318_3542_4666 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout6 (x_2326_3543_4667 , x_2327_3544_4668, x_2328_3545_4669, x_2329_3546_4670, x_2330_3547_4671, x_2331_3548_4672, x_2332_3549_4673) => 
  let val wildcard_2340_3550_4674 = (print "(Layout6") in 
  let val wildcard_2348_3551_4675 = (print " ") in 
  let val y_2333_3552_4676 = (internal_print_BlogHeader x_2326_3543_4667) in 
  let val wildcard_2347_3553_4677 = (print " ") in 
  let val y_2334_3554_4678 = (internal_print_BlogId x_2327_3544_4668) in 
  let val wildcard_2346_3555_4679 = (print " ") in 
  let val y_2335_3556_4680 = (internal_print_BlogAuthor x_2328_3545_4669) in 
  let val wildcard_2345_3557_4681 = (print " ") in 
  let val y_2336_3558_4682 = (internal_print_BlogDate x_2329_3546_4670) in 
  let val wildcard_2344_3559_4683 = (print " ") in 
  let val y_2337_3560_4684 = (internal_print_BlogContent x_2330_3547_4671) in 
  let val wildcard_2343_3561_4685 = (print " ") in 
  let val y_2338_3562_4686 = (internal_print_Blog x_2331_3548_4672) in 
  let val wildcard_2342_3563_4687 = (print " ") in 
  let val y_2339_3564_4688 = (internal_print_BlogTags x_2332_3549_4673) in 
  let val wildcard_2341_3565_4689 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout7 (x_2349_3566_4690 , x_2350_3567_4691, x_2351_3568_4692, x_2352_3569_4693, x_2353_3570_4694, x_2354_3571_4695, x_2355_3572_4696) => 
  let val wildcard_2363_3573_4697 = (print "(Layout7") in 
  let val wildcard_2371_3574_4698 = (print " ") in 
  let val y_2356_3575_4699 = (internal_print_Blog x_2349_3566_4690) in 
  let val wildcard_2370_3576_4700 = (print " ") in 
  let val y_2357_3577_4701 = (internal_print_BlogContent x_2350_3567_4691) in 
  let val wildcard_2369_3578_4702 = (print " ") in 
  let val y_2358_3579_4703 = (internal_print_BlogHeader x_2351_3568_4692) in 
  let val wildcard_2368_3580_4704 = (print " ") in 
  let val y_2359_3581_4705 = (internal_print_BlogId x_2352_3569_4693) in 
  let val wildcard_2367_3582_4706 = (print " ") in 
  let val y_2360_3583_4707 = (internal_print_BlogAuthor x_2353_3570_4694) in 
  let val wildcard_2366_3584_4708 = (print " ") in 
  let val y_2361_3585_4709 = (internal_print_BlogDate x_2354_3571_4695) in 
  let val wildcard_2365_3586_4710 = (print " ") in 
  let val y_2362_3587_4711 = (internal_print_BlogTags x_2355_3572_4696) in 
  let val wildcard_2364_3588_4712 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout8 (x_2372_3589_4713 , x_2373_3590_4714, x_2374_3591_4715, x_2375_3592_4716, x_2376_3593_4717, x_2377_3594_4718, x_2378_3595_4719) => 
  let val wildcard_2386_3596_4720 = (print "(Layout8") in 
  let val wildcard_2394_3597_4721 = (print " ") in 
  let val y_2379_3598_4722 = (internal_print_BlogContent x_2372_3589_4713) in 
  let val wildcard_2393_3599_4723 = (print " ") in 
  let val y_2380_3600_4724 = (internal_print_Blog x_2373_3590_4714) in 
  let val wildcard_2392_3601_4725 = (print " ") in 
  let val y_2381_3602_4726 = (internal_print_BlogId x_2374_3591_4715) in 
  let val wildcard_2391_3603_4727 = (print " ") in 
  let val y_2382_3604_4728 = (internal_print_BlogAuthor x_2375_3592_4716) in 
  let val wildcard_2390_3605_4729 = (print " ") in 
  let val y_2383_3606_4730 = (internal_print_BlogDate x_2376_3593_4717) in 
  let val wildcard_2389_3607_4731 = (print " ") in 
  let val y_2384_3608_4732 = (internal_print_BlogHeader x_2377_3594_4718) in 
  let val wildcard_2388_3609_4733 = (print " ") in 
  let val y_2385_3610_4734 = (internal_print_BlogTags x_2378_3595_4719) in 
  let val wildcard_2387_3611_4735 = (print ")") in () end end end end end end end end end end end end end end end end);

fun internal_print_PList_v_1068 (arg_2462_3678_4802) = (case arg_2462_3678_4802 of Nil_v_1068 => 
  let val wildcard_2463_3679_4803 = (print "(Nil_v_1068") in 
  let val wildcard_2464_3680_4804 = (print ")") in () end end 
  | Cons_v_1068 (x_2465_3681_4805 , x_2466_3682_4806) => 
  let val wildcard_2469_3683_4807 = (print "(Cons_v_1068") in 
  let val wildcard_2472_3684_4808 = (print " ") in 
  let val y_2467_3685_4809 = (internal_print_Block x_2465_3681_4805) in 
  let val wildcard_2471_3686_4810 = (print " ") in 
  let val y_2468_3687_4811 = (internal_print_PList_v_1068 x_2466_3682_4806) in 
  let val wildcard_2470_3688_4812 = (print ")") in () end end end end end end);

fun internal_traverse_Inline (arg_1744_2966_4090) = (case arg_1744_2966_4090 of Str (x_1745_2967_4091) => () 
  | Emph (x_1747_2968_4092) => 
  let val y_1748_2969_4093 = (internal_traverse_PList_v_1065 x_1747_2968_4092) in () end
  | Space => ())
and internal_traverse_PList_v_1065 (arg_2431_3647_4771) = (case arg_2431_3647_4771 of Nil_v_1065 => () 
  | Cons_v_1065 (x_2432_3648_4772 , x_2433_3649_4773) => 
  let val y_2434_3650_4774 = (internal_traverse_Inline x_2432_3648_4772) in 
  let val y_2435_3651_4775 = (internal_traverse_PList_v_1065 x_2433_3649_4773) in () end end);

fun internal_traverse_Block (arg_1768_2989_4113) = (case arg_1768_2989_4113 of Plain (x_1769_2990_4114) => 
  let val y_1770_2991_4115 = (internal_traverse_PList_v_1065 x_1769_2990_4114) in () end 
  | Null => ());

fun internal_traverse_BlogContent (arg_1845_3062_4186) = (case arg_1845_3062_4186 of Content (x_1846_3063_4187) => 
  let val y_1847_3064_4188 = (internal_traverse_Block x_1846_3063_4187) in () end);

fun internal_traverse_Blog (arg_2095_3312_4436) = (case arg_2095_3312_4436 of End => () 
  | Layout1 (x_2096_3313_4437 , x_2097_3314_4438, x_2098_3315_4439, x_2099_3316_4440, x_2100_3317_4441, x_2101_3318_4442, x_2102_3319_4443) => 
  let val y_2103_3320_4444 = (internal_traverse_BlogHeader x_2096_3313_4437) in 
  let val y_2104_3321_4445 = (internal_traverse_BlogId x_2097_3314_4438) in 
  let val y_2105_3322_4446 = (internal_traverse_BlogAuthor x_2098_3315_4439) in 
  let val y_2106_3323_4447 = (internal_traverse_BlogDate x_2099_3316_4440) in 
  let val y_2107_3324_4448 = (internal_traverse_BlogContent x_2100_3317_4441) in 
  let val y_2108_3325_4449 = (internal_traverse_BlogTags x_2101_3318_4442) in 
  let val y_2109_3326_4450 = (internal_traverse_Blog x_2102_3319_4443) in () end end end end end end end
  | Layout2 (x_2110_3327_4451 , x_2111_3328_4452, x_2112_3329_4453, x_2113_3330_4454, x_2114_3331_4455, x_2115_3332_4456, x_2116_3333_4457) => 
  let val y_2117_3334_4458 = (internal_traverse_BlogContent x_2110_3327_4451) in 
  let val y_2118_3335_4459 = (internal_traverse_BlogTags x_2111_3328_4452) in 
  let val y_2119_3336_4460 = (internal_traverse_Blog x_2112_3329_4453) in 
  let val y_2120_3337_4461 = (internal_traverse_BlogHeader x_2113_3330_4454) in 
  let val y_2121_3338_4462 = (internal_traverse_BlogId x_2114_3331_4455) in 
  let val y_2122_3339_4463 = (internal_traverse_BlogAuthor x_2115_3332_4456) in 
  let val y_2123_3340_4464 = (internal_traverse_BlogDate x_2116_3333_4457) in () end end end end end end end
  | Layout3 (x_2124_3341_4465 , x_2125_3342_4466, x_2126_3343_4467, x_2127_3344_4468, x_2128_3345_4469, x_2129_3346_4470, x_2130_3347_4471) => 
  let val y_2131_3348_4472 = (internal_traverse_BlogTags x_2124_3341_4465) in 
  let val y_2132_3349_4473 = (internal_traverse_Blog x_2125_3342_4466) in 
  let val y_2133_3350_4474 = (internal_traverse_BlogContent x_2126_3343_4467) in 
  let val y_2134_3351_4475 = (internal_traverse_BlogHeader x_2127_3344_4468) in 
  let val y_2135_3352_4476 = (internal_traverse_BlogId x_2128_3345_4469) in 
  let val y_2136_3353_4477 = (internal_traverse_BlogAuthor x_2129_3346_4470) in 
  let val y_2137_3354_4478 = (internal_traverse_BlogDate x_2130_3347_4471) in () end end end end end end end
  | Layout4 (x_2138_3355_4479 , x_2139_3356_4480, x_2140_3357_4481, x_2141_3358_4482, x_2142_3359_4483, x_2143_3360_4484, x_2144_3361_4485) => 
  let val y_2145_3362_4486 = (internal_traverse_BlogTags x_2138_3355_4479) in 
  let val y_2146_3363_4487 = (internal_traverse_BlogContent x_2139_3356_4480) in 
  let val y_2147_3364_4488 = (internal_traverse_Blog x_2140_3357_4481) in 
  let val y_2148_3365_4489 = (internal_traverse_BlogHeader x_2141_3358_4482) in 
  let val y_2149_3366_4490 = (internal_traverse_BlogId x_2142_3359_4483) in 
  let val y_2150_3367_4491 = (internal_traverse_BlogAuthor x_2143_3360_4484) in 
  let val y_2151_3368_4492 = (internal_traverse_BlogDate x_2144_3361_4485) in () end end end end end end end
  | Layout5 (x_2152_3369_4493 , x_2153_3370_4494, x_2154_3371_4495, x_2155_3372_4496, x_2156_3373_4497, x_2157_3374_4498, x_2158_3375_4499) => 
  let val y_2159_3376_4500 = (internal_traverse_Blog x_2152_3369_4493) in 
  let val y_2160_3377_4501 = (internal_traverse_BlogTags x_2153_3370_4494) in 
  let val y_2161_3378_4502 = (internal_traverse_BlogContent x_2154_3371_4495) in 
  let val y_2162_3379_4503 = (internal_traverse_BlogHeader x_2155_3372_4496) in 
  let val y_2163_3380_4504 = (internal_traverse_BlogId x_2156_3373_4497) in 
  let val y_2164_3381_4505 = (internal_traverse_BlogAuthor x_2157_3374_4498) in 
  let val y_2165_3382_4506 = (internal_traverse_BlogDate x_2158_3375_4499) in () end end end end end end end
  | Layout6 (x_2166_3383_4507 , x_2167_3384_4508, x_2168_3385_4509, x_2169_3386_4510, x_2170_3387_4511, x_2171_3388_4512, x_2172_3389_4513) => 
  let val y_2173_3390_4514 = (internal_traverse_BlogHeader x_2166_3383_4507) in 
  let val y_2174_3391_4515 = (internal_traverse_BlogId x_2167_3384_4508) in 
  let val y_2175_3392_4516 = (internal_traverse_BlogAuthor x_2168_3385_4509) in 
  let val y_2176_3393_4517 = (internal_traverse_BlogDate x_2169_3386_4510) in 
  let val y_2177_3394_4518 = (internal_traverse_BlogContent x_2170_3387_4511) in 
  let val y_2178_3395_4519 = (internal_traverse_Blog x_2171_3388_4512) in 
  let val y_2179_3396_4520 = (internal_traverse_BlogTags x_2172_3389_4513) in () end end end end end end end
  | Layout7 (x_2180_3397_4521 , x_2181_3398_4522, x_2182_3399_4523, x_2183_3400_4524, x_2184_3401_4525, x_2185_3402_4526, x_2186_3403_4527) => 
  let val y_2187_3404_4528 = (internal_traverse_Blog x_2180_3397_4521) in 
  let val y_2188_3405_4529 = (internal_traverse_BlogContent x_2181_3398_4522) in 
  let val y_2189_3406_4530 = (internal_traverse_BlogHeader x_2182_3399_4523) in 
  let val y_2190_3407_4531 = (internal_traverse_BlogId x_2183_3400_4524) in 
  let val y_2191_3408_4532 = (internal_traverse_BlogAuthor x_2184_3401_4525) in 
  let val y_2192_3409_4533 = (internal_traverse_BlogDate x_2185_3402_4526) in 
  let val y_2193_3410_4534 = (internal_traverse_BlogTags x_2186_3403_4527) in () end end end end end end end
  | Layout8 (x_2194_3411_4535 , x_2195_3412_4536, x_2196_3413_4537, x_2197_3414_4538, x_2198_3415_4539, x_2199_3416_4540, x_2200_3417_4541) => 
  let val y_2201_3418_4542 = (internal_traverse_BlogContent x_2194_3411_4535) in 
  let val y_2202_3419_4543 = (internal_traverse_Blog x_2195_3412_4536) in 
  let val y_2203_3420_4544 = (internal_traverse_BlogId x_2196_3413_4537) in 
  let val y_2204_3421_4545 = (internal_traverse_BlogAuthor x_2197_3414_4538) in 
  let val y_2205_3422_4546 = (internal_traverse_BlogDate x_2198_3415_4539) in 
  let val y_2206_3423_4547 = (internal_traverse_BlogHeader x_2199_3416_4540) in 
  let val y_2207_3424_4548 = (internal_traverse_BlogTags x_2200_3417_4541) in () end end end end end end end);

fun internal_traverse_PList_v_1068 (arg_2457_3673_4797) = (case arg_2457_3673_4797 of Nil_v_1068 => () 
  | Cons_v_1068 (x_2458_3674_4798 , x_2459_3675_4799) => 
  let val y_2460_3676_4800 = (internal_traverse_Block x_2458_3674_4798) in 
  let val y_2461_3677_4801 = (internal_traverse_PList_v_1068 x_2459_3675_4799) in () end end);

fun internal_copy_without_ptrs_Inline (arg_1739_2961_4085) = (case arg_1739_2961_4085 of Str (x_1740_2962_4086) => (Str (x_1740_2962_4086)) 
  | Emph (x_1742_2964_4088) => 
  let val y_1743_2965_4089 = (internal_copy_without_ptrs_PList_v_1065 x_1742_2964_4088) in (Emph (y_1743_2965_4089)) end
  | Space => Space)
and internal_copy_without_ptrs_PList_v_1065 (arg_2426_3642_4766) = (case arg_2426_3642_4766 of Nil_v_1065 => Nil_v_1065 
  | Cons_v_1065 (x_2427_3643_4767 , x_2428_3644_4768) => 
  let val y_2429_3645_4769 = (internal_copy_without_ptrs_Inline x_2427_3643_4767) in 
  let val y_2430_3646_4770 = (internal_copy_without_ptrs_PList_v_1065 x_2428_3644_4768) in (Cons_v_1065 (y_2429_3645_4769 , y_2430_3646_4770)) end end);

fun internal_copy_without_ptrs_Block (arg_1765_2986_4110) = (case arg_1765_2986_4110 of Plain (x_1766_2987_4111) => 
  let val y_1767_2988_4112 = (internal_copy_without_ptrs_PList_v_1065 x_1766_2987_4111) in (Plain (y_1767_2988_4112)) end 
  | Null => Null);

fun internal_copy_without_ptrs_BlogContent (arg_1842_3059_4183) = (case arg_1842_3059_4183 of Content (x_1843_3060_4184) => 
  let val y_1844_3061_4185 = (internal_copy_without_ptrs_Block x_1843_3060_4184) in (Content (y_1844_3061_4185)) end);

fun internal_copy_without_ptrs_Blog (arg_1982_3199_4323) = (case arg_1982_3199_4323 of End => End 
  | Layout1 (x_1983_3200_4324 , x_1984_3201_4325, x_1985_3202_4326, x_1986_3203_4327, x_1987_3204_4328, x_1988_3205_4329, x_1989_3206_4330) => 
  let val y_1990_3207_4331 = (internal_copy_without_ptrs_BlogHeader x_1983_3200_4324) in 
  let val y_1991_3208_4332 = (internal_copy_without_ptrs_BlogId x_1984_3201_4325) in 
  let val y_1992_3209_4333 = (internal_copy_without_ptrs_BlogAuthor x_1985_3202_4326) in 
  let val y_1993_3210_4334 = (internal_copy_without_ptrs_BlogDate x_1986_3203_4327) in 
  let val y_1994_3211_4335 = (internal_copy_without_ptrs_BlogContent x_1987_3204_4328) in 
  let val y_1995_3212_4336 = (internal_copy_without_ptrs_BlogTags x_1988_3205_4329) in 
  let val y_1996_3213_4337 = (internal_copy_without_ptrs_Blog x_1989_3206_4330) in (Layout1 (y_1990_3207_4331 , y_1991_3208_4332, y_1992_3209_4333, y_1993_3210_4334, y_1994_3211_4335, y_1995_3212_4336, y_1996_3213_4337)) end end end end end end end
  | Layout2 (x_1997_3214_4338 , x_1998_3215_4339, x_1999_3216_4340, x_2000_3217_4341, x_2001_3218_4342, x_2002_3219_4343, x_2003_3220_4344) => 
  let val y_2004_3221_4345 = (internal_copy_without_ptrs_BlogContent x_1997_3214_4338) in 
  let val y_2005_3222_4346 = (internal_copy_without_ptrs_BlogTags x_1998_3215_4339) in 
  let val y_2006_3223_4347 = (internal_copy_without_ptrs_Blog x_1999_3216_4340) in 
  let val y_2007_3224_4348 = (internal_copy_without_ptrs_BlogHeader x_2000_3217_4341) in 
  let val y_2008_3225_4349 = (internal_copy_without_ptrs_BlogId x_2001_3218_4342) in 
  let val y_2009_3226_4350 = (internal_copy_without_ptrs_BlogAuthor x_2002_3219_4343) in 
  let val y_2010_3227_4351 = (internal_copy_without_ptrs_BlogDate x_2003_3220_4344) in (Layout2 (y_2004_3221_4345 , y_2005_3222_4346, y_2006_3223_4347, y_2007_3224_4348, y_2008_3225_4349, y_2009_3226_4350, y_2010_3227_4351)) end end end end end end end
  | Layout3 (x_2011_3228_4352 , x_2012_3229_4353, x_2013_3230_4354, x_2014_3231_4355, x_2015_3232_4356, x_2016_3233_4357, x_2017_3234_4358) => 
  let val y_2018_3235_4359 = (internal_copy_without_ptrs_BlogTags x_2011_3228_4352) in 
  let val y_2019_3236_4360 = (internal_copy_without_ptrs_Blog x_2012_3229_4353) in 
  let val y_2020_3237_4361 = (internal_copy_without_ptrs_BlogContent x_2013_3230_4354) in 
  let val y_2021_3238_4362 = (internal_copy_without_ptrs_BlogHeader x_2014_3231_4355) in 
  let val y_2022_3239_4363 = (internal_copy_without_ptrs_BlogId x_2015_3232_4356) in 
  let val y_2023_3240_4364 = (internal_copy_without_ptrs_BlogAuthor x_2016_3233_4357) in 
  let val y_2024_3241_4365 = (internal_copy_without_ptrs_BlogDate x_2017_3234_4358) in (Layout3 (y_2018_3235_4359 , y_2019_3236_4360, y_2020_3237_4361, y_2021_3238_4362, y_2022_3239_4363, y_2023_3240_4364, y_2024_3241_4365)) end end end end end end end
  | Layout4 (x_2025_3242_4366 , x_2026_3243_4367, x_2027_3244_4368, x_2028_3245_4369, x_2029_3246_4370, x_2030_3247_4371, x_2031_3248_4372) => 
  let val y_2032_3249_4373 = (internal_copy_without_ptrs_BlogTags x_2025_3242_4366) in 
  let val y_2033_3250_4374 = (internal_copy_without_ptrs_BlogContent x_2026_3243_4367) in 
  let val y_2034_3251_4375 = (internal_copy_without_ptrs_Blog x_2027_3244_4368) in 
  let val y_2035_3252_4376 = (internal_copy_without_ptrs_BlogHeader x_2028_3245_4369) in 
  let val y_2036_3253_4377 = (internal_copy_without_ptrs_BlogId x_2029_3246_4370) in 
  let val y_2037_3254_4378 = (internal_copy_without_ptrs_BlogAuthor x_2030_3247_4371) in 
  let val y_2038_3255_4379 = (internal_copy_without_ptrs_BlogDate x_2031_3248_4372) in (Layout4 (y_2032_3249_4373 , y_2033_3250_4374, y_2034_3251_4375, y_2035_3252_4376, y_2036_3253_4377, y_2037_3254_4378, y_2038_3255_4379)) end end end end end end end
  | Layout5 (x_2039_3256_4380 , x_2040_3257_4381, x_2041_3258_4382, x_2042_3259_4383, x_2043_3260_4384, x_2044_3261_4385, x_2045_3262_4386) => 
  let val y_2046_3263_4387 = (internal_copy_without_ptrs_Blog x_2039_3256_4380) in 
  let val y_2047_3264_4388 = (internal_copy_without_ptrs_BlogTags x_2040_3257_4381) in 
  let val y_2048_3265_4389 = (internal_copy_without_ptrs_BlogContent x_2041_3258_4382) in 
  let val y_2049_3266_4390 = (internal_copy_without_ptrs_BlogHeader x_2042_3259_4383) in 
  let val y_2050_3267_4391 = (internal_copy_without_ptrs_BlogId x_2043_3260_4384) in 
  let val y_2051_3268_4392 = (internal_copy_without_ptrs_BlogAuthor x_2044_3261_4385) in 
  let val y_2052_3269_4393 = (internal_copy_without_ptrs_BlogDate x_2045_3262_4386) in (Layout5 (y_2046_3263_4387 , y_2047_3264_4388, y_2048_3265_4389, y_2049_3266_4390, y_2050_3267_4391, y_2051_3268_4392, y_2052_3269_4393)) end end end end end end end
  | Layout6 (x_2053_3270_4394 , x_2054_3271_4395, x_2055_3272_4396, x_2056_3273_4397, x_2057_3274_4398, x_2058_3275_4399, x_2059_3276_4400) => 
  let val y_2060_3277_4401 = (internal_copy_without_ptrs_BlogHeader x_2053_3270_4394) in 
  let val y_2061_3278_4402 = (internal_copy_without_ptrs_BlogId x_2054_3271_4395) in 
  let val y_2062_3279_4403 = (internal_copy_without_ptrs_BlogAuthor x_2055_3272_4396) in 
  let val y_2063_3280_4404 = (internal_copy_without_ptrs_BlogDate x_2056_3273_4397) in 
  let val y_2064_3281_4405 = (internal_copy_without_ptrs_BlogContent x_2057_3274_4398) in 
  let val y_2065_3282_4406 = (internal_copy_without_ptrs_Blog x_2058_3275_4399) in 
  let val y_2066_3283_4407 = (internal_copy_without_ptrs_BlogTags x_2059_3276_4400) in (Layout6 (y_2060_3277_4401 , y_2061_3278_4402, y_2062_3279_4403, y_2063_3280_4404, y_2064_3281_4405, y_2065_3282_4406, y_2066_3283_4407)) end end end end end end end
  | Layout7 (x_2067_3284_4408 , x_2068_3285_4409, x_2069_3286_4410, x_2070_3287_4411, x_2071_3288_4412, x_2072_3289_4413, x_2073_3290_4414) => 
  let val y_2074_3291_4415 = (internal_copy_without_ptrs_Blog x_2067_3284_4408) in 
  let val y_2075_3292_4416 = (internal_copy_without_ptrs_BlogContent x_2068_3285_4409) in 
  let val y_2076_3293_4417 = (internal_copy_without_ptrs_BlogHeader x_2069_3286_4410) in 
  let val y_2077_3294_4418 = (internal_copy_without_ptrs_BlogId x_2070_3287_4411) in 
  let val y_2078_3295_4419 = (internal_copy_without_ptrs_BlogAuthor x_2071_3288_4412) in 
  let val y_2079_3296_4420 = (internal_copy_without_ptrs_BlogDate x_2072_3289_4413) in 
  let val y_2080_3297_4421 = (internal_copy_without_ptrs_BlogTags x_2073_3290_4414) in (Layout7 (y_2074_3291_4415 , y_2075_3292_4416, y_2076_3293_4417, y_2077_3294_4418, y_2078_3295_4419, y_2079_3296_4420, y_2080_3297_4421)) end end end end end end end
  | Layout8 (x_2081_3298_4422 , x_2082_3299_4423, x_2083_3300_4424, x_2084_3301_4425, x_2085_3302_4426, x_2086_3303_4427, x_2087_3304_4428) => 
  let val y_2088_3305_4429 = (internal_copy_without_ptrs_BlogContent x_2081_3298_4422) in 
  let val y_2089_3306_4430 = (internal_copy_without_ptrs_Blog x_2082_3299_4423) in 
  let val y_2090_3307_4431 = (internal_copy_without_ptrs_BlogId x_2083_3300_4424) in 
  let val y_2091_3308_4432 = (internal_copy_without_ptrs_BlogAuthor x_2084_3301_4425) in 
  let val y_2092_3309_4433 = (internal_copy_without_ptrs_BlogDate x_2085_3302_4426) in 
  let val y_2093_3310_4434 = (internal_copy_without_ptrs_BlogHeader x_2086_3303_4427) in 
  let val y_2094_3311_4435 = (internal_copy_without_ptrs_BlogTags x_2087_3304_4428) in (Layout8 (y_2088_3305_4429 , y_2089_3306_4430, y_2090_3307_4431, y_2091_3308_4432, y_2092_3309_4433, y_2093_3310_4434, y_2094_3311_4435)) end end end end end end end);

fun internal_copy_without_ptrs_PList_v_1068 (arg_2452_3668_4792) = (case arg_2452_3668_4792 of Nil_v_1068 => Nil_v_1068 
  | Cons_v_1068 (x_2453_3669_4793 , x_2454_3670_4794) => 
  let val y_2455_3671_4795 = (internal_copy_without_ptrs_Block x_2453_3669_4793) in 
  let val y_2456_3672_4796 = (internal_copy_without_ptrs_PList_v_1068 x_2454_3670_4794) in (Cons_v_1068 (y_2455_3671_4795 , y_2456_3672_4796)) end end);

fun internal_copy_Inline (arg_1734_2956_4080) = (case arg_1734_2956_4080 of Str (x_1735_2957_4081) => (Str (x_1735_2957_4081)) 
  | Emph (x_1737_2959_4083) => 
  let val y_1738_2960_4084 = (internal_copy_PList_v_1065 x_1737_2959_4083) in (Emph (y_1738_2960_4084)) end
  | Space => Space)
and internal_copy_PList_v_1065 (arg_2421_3637_4761) = (case arg_2421_3637_4761 of Nil_v_1065 => Nil_v_1065 
  | Cons_v_1065 (x_2422_3638_4762 , x_2423_3639_4763) => 
  let val y_2424_3640_4764 = (internal_copy_Inline x_2422_3638_4762) in 
  let val y_2425_3641_4765 = (internal_copy_PList_v_1065 x_2423_3639_4763) in (Cons_v_1065 (y_2424_3640_4764 , y_2425_3641_4765)) end end);

fun internal_copy_Block (arg_1762_2983_4107) = (case arg_1762_2983_4107 of Plain (x_1763_2984_4108) => 
  let val y_1764_2985_4109 = (internal_copy_PList_v_1065 x_1763_2984_4108) in (Plain (y_1764_2985_4109)) end 
  | Null => Null);

fun internal_copy_BlogContent (arg_1839_3056_4180) = (case arg_1839_3056_4180 of Content (x_1840_3057_4181) => 
  let val y_1841_3058_4182 = (internal_copy_Block x_1840_3057_4181) in (Content (y_1841_3058_4182)) end);

fun internal_copy_Blog (arg_1869_3086_4210) = (case arg_1869_3086_4210 of End => End 
  | Layout1 (x_1870_3087_4211 , x_1871_3088_4212, x_1872_3089_4213, x_1873_3090_4214, x_1874_3091_4215, x_1875_3092_4216, x_1876_3093_4217) => 
  let val y_1877_3094_4218 = (internal_copy_BlogHeader x_1870_3087_4211) in 
  let val y_1878_3095_4219 = (internal_copy_BlogId x_1871_3088_4212) in 
  let val y_1879_3096_4220 = (internal_copy_BlogAuthor x_1872_3089_4213) in 
  let val y_1880_3097_4221 = (internal_copy_BlogDate x_1873_3090_4214) in 
  let val y_1881_3098_4222 = (internal_copy_BlogContent x_1874_3091_4215) in 
  let val y_1882_3099_4223 = (internal_copy_BlogTags x_1875_3092_4216) in 
  let val y_1883_3100_4224 = (internal_copy_Blog x_1876_3093_4217) in (Layout1 (y_1877_3094_4218 , y_1878_3095_4219, y_1879_3096_4220, y_1880_3097_4221, y_1881_3098_4222, y_1882_3099_4223, y_1883_3100_4224)) end end end end end end end
  | Layout2 (x_1884_3101_4225 , x_1885_3102_4226, x_1886_3103_4227, x_1887_3104_4228, x_1888_3105_4229, x_1889_3106_4230, x_1890_3107_4231) => 
  let val y_1891_3108_4232 = (internal_copy_BlogContent x_1884_3101_4225) in 
  let val y_1892_3109_4233 = (internal_copy_BlogTags x_1885_3102_4226) in 
  let val y_1893_3110_4234 = (internal_copy_Blog x_1886_3103_4227) in 
  let val y_1894_3111_4235 = (internal_copy_BlogHeader x_1887_3104_4228) in 
  let val y_1895_3112_4236 = (internal_copy_BlogId x_1888_3105_4229) in 
  let val y_1896_3113_4237 = (internal_copy_BlogAuthor x_1889_3106_4230) in 
  let val y_1897_3114_4238 = (internal_copy_BlogDate x_1890_3107_4231) in (Layout2 (y_1891_3108_4232 , y_1892_3109_4233, y_1893_3110_4234, y_1894_3111_4235, y_1895_3112_4236, y_1896_3113_4237, y_1897_3114_4238)) end end end end end end end
  | Layout3 (x_1898_3115_4239 , x_1899_3116_4240, x_1900_3117_4241, x_1901_3118_4242, x_1902_3119_4243, x_1903_3120_4244, x_1904_3121_4245) => 
  let val y_1905_3122_4246 = (internal_copy_BlogTags x_1898_3115_4239) in 
  let val y_1906_3123_4247 = (internal_copy_Blog x_1899_3116_4240) in 
  let val y_1907_3124_4248 = (internal_copy_BlogContent x_1900_3117_4241) in 
  let val y_1908_3125_4249 = (internal_copy_BlogHeader x_1901_3118_4242) in 
  let val y_1909_3126_4250 = (internal_copy_BlogId x_1902_3119_4243) in 
  let val y_1910_3127_4251 = (internal_copy_BlogAuthor x_1903_3120_4244) in 
  let val y_1911_3128_4252 = (internal_copy_BlogDate x_1904_3121_4245) in (Layout3 (y_1905_3122_4246 , y_1906_3123_4247, y_1907_3124_4248, y_1908_3125_4249, y_1909_3126_4250, y_1910_3127_4251, y_1911_3128_4252)) end end end end end end end
  | Layout4 (x_1912_3129_4253 , x_1913_3130_4254, x_1914_3131_4255, x_1915_3132_4256, x_1916_3133_4257, x_1917_3134_4258, x_1918_3135_4259) => 
  let val y_1919_3136_4260 = (internal_copy_BlogTags x_1912_3129_4253) in 
  let val y_1920_3137_4261 = (internal_copy_BlogContent x_1913_3130_4254) in 
  let val y_1921_3138_4262 = (internal_copy_Blog x_1914_3131_4255) in 
  let val y_1922_3139_4263 = (internal_copy_BlogHeader x_1915_3132_4256) in 
  let val y_1923_3140_4264 = (internal_copy_BlogId x_1916_3133_4257) in 
  let val y_1924_3141_4265 = (internal_copy_BlogAuthor x_1917_3134_4258) in 
  let val y_1925_3142_4266 = (internal_copy_BlogDate x_1918_3135_4259) in (Layout4 (y_1919_3136_4260 , y_1920_3137_4261, y_1921_3138_4262, y_1922_3139_4263, y_1923_3140_4264, y_1924_3141_4265, y_1925_3142_4266)) end end end end end end end
  | Layout5 (x_1926_3143_4267 , x_1927_3144_4268, x_1928_3145_4269, x_1929_3146_4270, x_1930_3147_4271, x_1931_3148_4272, x_1932_3149_4273) => 
  let val y_1933_3150_4274 = (internal_copy_Blog x_1926_3143_4267) in 
  let val y_1934_3151_4275 = (internal_copy_BlogTags x_1927_3144_4268) in 
  let val y_1935_3152_4276 = (internal_copy_BlogContent x_1928_3145_4269) in 
  let val y_1936_3153_4277 = (internal_copy_BlogHeader x_1929_3146_4270) in 
  let val y_1937_3154_4278 = (internal_copy_BlogId x_1930_3147_4271) in 
  let val y_1938_3155_4279 = (internal_copy_BlogAuthor x_1931_3148_4272) in 
  let val y_1939_3156_4280 = (internal_copy_BlogDate x_1932_3149_4273) in (Layout5 (y_1933_3150_4274 , y_1934_3151_4275, y_1935_3152_4276, y_1936_3153_4277, y_1937_3154_4278, y_1938_3155_4279, y_1939_3156_4280)) end end end end end end end
  | Layout6 (x_1940_3157_4281 , x_1941_3158_4282, x_1942_3159_4283, x_1943_3160_4284, x_1944_3161_4285, x_1945_3162_4286, x_1946_3163_4287) => 
  let val y_1947_3164_4288 = (internal_copy_BlogHeader x_1940_3157_4281) in 
  let val y_1948_3165_4289 = (internal_copy_BlogId x_1941_3158_4282) in 
  let val y_1949_3166_4290 = (internal_copy_BlogAuthor x_1942_3159_4283) in 
  let val y_1950_3167_4291 = (internal_copy_BlogDate x_1943_3160_4284) in 
  let val y_1951_3168_4292 = (internal_copy_BlogContent x_1944_3161_4285) in 
  let val y_1952_3169_4293 = (internal_copy_Blog x_1945_3162_4286) in 
  let val y_1953_3170_4294 = (internal_copy_BlogTags x_1946_3163_4287) in (Layout6 (y_1947_3164_4288 , y_1948_3165_4289, y_1949_3166_4290, y_1950_3167_4291, y_1951_3168_4292, y_1952_3169_4293, y_1953_3170_4294)) end end end end end end end
  | Layout7 (x_1954_3171_4295 , x_1955_3172_4296, x_1956_3173_4297, x_1957_3174_4298, x_1958_3175_4299, x_1959_3176_4300, x_1960_3177_4301) => 
  let val y_1961_3178_4302 = (internal_copy_Blog x_1954_3171_4295) in 
  let val y_1962_3179_4303 = (internal_copy_BlogContent x_1955_3172_4296) in 
  let val y_1963_3180_4304 = (internal_copy_BlogHeader x_1956_3173_4297) in 
  let val y_1964_3181_4305 = (internal_copy_BlogId x_1957_3174_4298) in 
  let val y_1965_3182_4306 = (internal_copy_BlogAuthor x_1958_3175_4299) in 
  let val y_1966_3183_4307 = (internal_copy_BlogDate x_1959_3176_4300) in 
  let val y_1967_3184_4308 = (internal_copy_BlogTags x_1960_3177_4301) in (Layout7 (y_1961_3178_4302 , y_1962_3179_4303, y_1963_3180_4304, y_1964_3181_4305, y_1965_3182_4306, y_1966_3183_4307, y_1967_3184_4308)) end end end end end end end
  | Layout8 (x_1968_3185_4309 , x_1969_3186_4310, x_1970_3187_4311, x_1971_3188_4312, x_1972_3189_4313, x_1973_3190_4314, x_1974_3191_4315) => 
  let val y_1975_3192_4316 = (internal_copy_BlogContent x_1968_3185_4309) in 
  let val y_1976_3193_4317 = (internal_copy_Blog x_1969_3186_4310) in 
  let val y_1977_3194_4318 = (internal_copy_BlogId x_1970_3187_4311) in 
  let val y_1978_3195_4319 = (internal_copy_BlogAuthor x_1971_3188_4312) in 
  let val y_1979_3196_4320 = (internal_copy_BlogDate x_1972_3189_4313) in 
  let val y_1980_3197_4321 = (internal_copy_BlogHeader x_1973_3190_4314) in 
  let val y_1981_3198_4322 = (internal_copy_BlogTags x_1974_3191_4315) in (Layout8 (y_1975_3192_4316 , y_1976_3193_4317, y_1977_3194_4318, y_1978_3195_4319, y_1979_3196_4320, y_1980_3197_4321, y_1981_3198_4322)) end end end end end end end);

fun internal_copy_PList_v_1068 (arg_2447_3663_4787) = (case arg_2447_3663_4787 of Nil_v_1068 => Nil_v_1068 
  | Cons_v_1068 (x_2448_3664_4788 , x_2449_3665_4789) => 
  let val y_2450_3666_4790 = (internal_copy_Block x_2448_3664_4788) in 
  let val y_2451_3667_4791 = (internal_copy_PList_v_1068 x_2449_3665_4789) in (Cons_v_1068 (y_2450_3666_4790 , y_2451_3667_4791)) end end);

fun maxInt (a_392_2789_4070 , b_393_2790_4071) = 
  let val fltIf_3860_4072 = (a_392_2789_4070 > b_393_2790_4071) in 
  (if fltIf_3860_4072 then a_392_2789_4070 
   else b_393_2790_4071) end;

fun cmp (start_312_2741_4039 , end_313_2742_4040, word1_314_2743_4041, word2_315_2744_4042) = 
  let val fltIf_3854_4043 = (start_312_2741_4039 < end_313_2742_4040) in 
  (if fltIf_3854_4043 then 
  let val a_316_2745_4046 = (CharArraySlice.sub(word1_314_2743_4041 , start_312_2741_4039)) in 
  let val b_317_2746_4049 = (CharArraySlice.sub(word2_315_2744_4042 , start_312_2741_4039)) in 
  let val fltIf_3855_4050 = (a_316_2745_4046 = b_317_2746_4049) in 
  let val eq_318_2747_4051 = 
  (if fltIf_3855_4050 then true 
   else false) in 
  let val fltAppE_3856_4052 = (start_312_2741_4039 + 1) in 
  let val recurse_319_2748_4053 = (cmp(fltAppE_3856_4052 , end_313_2742_4040, word1_314_2743_4041, word2_315_2744_4042)) in (eq_318_2747_4051 andalso recurse_319_2748_4053) end end end end end end 
   else true) end;

fun compareWord (word1_320_2749_4054 , word2_321_2750_4055) = 
  let val len1_322_2751_4057 = (CharArraySlice.length word1_320_2749_4054) in 
  let val len2_323_2752_4059 = (CharArraySlice.length word2_321_2750_4055) in 
  let val fltIf_3857_4060 = (len1_322_2751_4057 = len2_323_2752_4059) in 
  let val compare_len_324_2753_4061 = 
  (if fltIf_3857_4060 then true 
   else false) in 
  (if compare_len_324_2753_4061 then (cmp(0 , len1_322_2751_4057, word1_320_2749_4054, word2_321_2750_4055)) 
   else false) end end end end;

fun searchTagList (keyword_308_2737_4033 , taglist_309_2738_4034) = (case taglist_309_2738_4034 of Nil_v_1066 => false 
  | Cons_v_1066 (word_310_2739_4035 , rst_311_2740_4036) => 
  let val fltPrm_3852_4037 = (compareWord(keyword_308_2737_4033 , word_310_2739_4035)) in 
  let val fltPrm_3853_4038 = (searchTagList(keyword_308_2737_4033 , rst_311_2740_4036)) in (fltPrm_3852_4037 orelse fltPrm_3853_4038) end end);

fun emphasizeInlineListForKeyword (keyword_270_2699_4014 , inline_list_271_2700_4015) = (case inline_list_271_2700_4015 of Nil_v_1065 => Nil_v_1065 
  | Cons_v_1065 (inline_272_2701_4016 , rst_273_2702_4017) => 
  let val newinline_274_2703_4018 = (emphasizeKeywordInline(keyword_270_2699_4014 , inline_272_2701_4016)) in 
  let val rst__275_2704_4019 = (emphasizeInlineListForKeyword(keyword_270_2699_4014 , rst_273_2702_4017)) in (Cons_v_1065 (newinline_274_2703_4018 , rst__275_2704_4019)) end end)
and emphasizeKeywordInline (keyword_276_2705_4020 , inline_277_2706_4021) = (case inline_277_2706_4021 of Str (text_278_2707_4022) => 
  let val isSame_279_2708_4023 = (compareWord(keyword_276_2705_4020 , text_278_2707_4022)) in 
  (if isSame_279_2708_4023 then 
  let val fltPkd_3848_4024 = (internal_copy_Inline inline_277_2706_4021) in 
  let val fltPkd_3849_4025 = Nil_v_1065 in 
  let val newlist_280_2709_4026 = (Cons_v_1065 (fltPkd_3848_4024 , fltPkd_3849_4025)) in (Emph (newlist_280_2709_4026)) end end end 
   else inline_277_2706_4021) end 
  | Emph (list_inline_281_2710_4027) => 
  let val fltPkd_3850_4028 = (emphasizeInlineListForKeyword(keyword_276_2705_4020 , list_inline_281_2710_4027)) in (Emph (fltPkd_3850_4028)) end
  | Space => Space);

fun emphasizeKeywordInBlock (keyword_282_2711_4029 , contentBlock_283_2712_4030) = (case contentBlock_283_2712_4030 of Plain (list_inline_284_2713_4031) => 
  let val fltPkd_3851_4032 = (emphasizeInlineListForKeyword(keyword_282_2711_4029 , list_inline_284_2713_4031)) in (Plain (fltPkd_3851_4032)) end 
  | Null => Null);

fun mkSomeTags (len_190_2639_4001) = 
  let val fltIf_3843_4002 = (len_190_2639_4001 <= 0) in 
  (if fltIf_3843_4002 then Nil_v_1066 
   else 
  let val vec_220_191_2640_4003 = ((fn internal__ => CharArraySlice.full(CharArray.array(internal__, #"0"))) 1) in 
  let val internal__192_2641_4004 = let val _ = (CharArraySlice.update(vec_220_191_2640_4003 , 0, #"a")) in vec_220_191_2640_4003 end in 
  let val fltAppE_3844_4006 = (len_190_2639_4001 - 1) in 
  let val rst_194_2643_4007 = (mkSomeTags fltAppE_3844_4006) in (Cons_v_1066 (vec_220_191_2640_4003 , rst_194_2643_4007)) end end end end) end;

fun getChar (decimal_109_2563_3975) = 
  let val fltIf_3818_3976 = (decimal_109_2563_3975 = 0) in 
  (if fltIf_3818_3976 then #"a" 
   else 
  let val fltIf_3819_3977 = (decimal_109_2563_3975 = 1) in 
  (if fltIf_3819_3977 then #"b" 
   else 
  let val fltIf_3820_3978 = (decimal_109_2563_3975 = 2) in 
  (if fltIf_3820_3978 then #"c" 
   else 
  let val fltIf_3821_3979 = (decimal_109_2563_3975 = 3) in 
  (if fltIf_3821_3979 then #"d" 
   else 
  let val fltIf_3822_3980 = (decimal_109_2563_3975 = 4) in 
  (if fltIf_3822_3980 then #"e" 
   else 
  let val fltIf_3823_3981 = (decimal_109_2563_3975 = 5) in 
  (if fltIf_3823_3981 then #"f" 
   else 
  let val fltIf_3824_3982 = (decimal_109_2563_3975 = 6) in 
  (if fltIf_3824_3982 then #"g" 
   else 
  let val fltIf_3825_3983 = (decimal_109_2563_3975 = 7) in 
  (if fltIf_3825_3983 then #"h" 
   else 
  let val fltIf_3826_3984 = (decimal_109_2563_3975 = 8) in 
  (if fltIf_3826_3984 then #"i" 
   else 
  let val fltIf_3827_3985 = (decimal_109_2563_3975 = 9) in 
  (if fltIf_3827_3985 then #"j" 
   else 
  let val fltIf_3828_3986 = (decimal_109_2563_3975 = 10) in 
  (if fltIf_3828_3986 then #"k" 
   else 
  let val fltIf_3829_3987 = (decimal_109_2563_3975 = 11) in 
  (if fltIf_3829_3987 then #"l" 
   else 
  let val fltIf_3830_3988 = (decimal_109_2563_3975 = 12) in 
  (if fltIf_3830_3988 then #"m" 
   else 
  let val fltIf_3831_3989 = (decimal_109_2563_3975 = 13) in 
  (if fltIf_3831_3989 then #"n" 
   else 
  let val fltIf_3832_3990 = (decimal_109_2563_3975 = 14) in 
  (if fltIf_3832_3990 then #"o" 
   else 
  let val fltIf_3833_3991 = (decimal_109_2563_3975 = 15) in 
  (if fltIf_3833_3991 then #"p" 
   else 
  let val fltIf_3834_3992 = (decimal_109_2563_3975 = 16) in 
  (if fltIf_3834_3992 then #"q" 
   else 
  let val fltIf_3835_3993 = (decimal_109_2563_3975 = 17) in 
  (if fltIf_3835_3993 then #"r" 
   else 
  let val fltIf_3836_3994 = (decimal_109_2563_3975 = 18) in 
  (if fltIf_3836_3994 then #"s" 
   else 
  let val fltIf_3837_3995 = (decimal_109_2563_3975 = 19) in 
  (if fltIf_3837_3995 then #"t" 
   else 
  let val fltIf_3838_3996 = (decimal_109_2563_3975 = 20) in 
  (if fltIf_3838_3996 then #"u" 
   else 
  let val fltIf_3839_3997 = (decimal_109_2563_3975 = 21) in 
  (if fltIf_3839_3997 then #"v" 
   else 
  let val fltIf_3840_3998 = (decimal_109_2563_3975 = 22) in 
  (if fltIf_3840_3998 then #"w" 
   else 
  let val fltIf_3841_3999 = (decimal_109_2563_3975 = 23) in 
  (if fltIf_3841_3999 then #"x" 
   else 
  let val fltIf_3842_4000 = (decimal_109_2563_3975 = 24) in 
  (if fltIf_3842_4000 then #"y" 
   else #"z") end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end;

fun mkChar (val_359_2788_4067) = 
  let val fltPrm_3859_4068 = (Word.toInt (MLton.Random.rand())) in 
  let val fltAppE_3858_4069 = (fltPrm_3859_4068 mod 26) in (getChar fltAppE_3858_4069) end end;

fun generate_loop_1078_1567 (vec_615_2946_4073 , idx_616_2947_4074, end_617_2948_4075) = 
  let val fltIf_3861_4076 = (idx_616_2947_4074 = end_617_2948_4075) in 
  (if fltIf_3861_4076 then vec_615_2946_4073 
   else 
  let val fltPrm_3862_4077 = (mkChar idx_616_2947_4074) in 
  let val vec1_620_2949_4078 = let val _ = (CharArraySlice.update(vec_615_2946_4073 , idx_616_2947_4074, fltPrm_3862_4077)) in vec_615_2946_4073 end in 
  let val fltAppE_3863_4079 = (idx_616_2947_4074 + 1) in (generate_loop_1078_1567(vec1_620_2949_4078 , fltAppE_3863_4079, end_617_2948_4075)) end end end) end;

fun getRandomString (length_359_2782_4042) = 
  let val n__364_2938_3732_4044 = 0 in 
  let val vec_365_2939_3733_4045 = ((fn internal__ =>
  CharArraySlice.full(CharArray.array(internal__, #"0"))) length_359_2782_4042) in 
  let val vec1_366_2940_3734_4046 = (generate_loop_1077_1562(vec_365_2939_3733_4045 , 0, n__364_2938_3732_4044)) in vec1_366_2940_3734_4046 end end end;

fun mkRandomInlineList (len_195_2644_4008) = 
  let val fltIf_3845_4009 = (len_195_2644_4008 <= 0) in 
  (if fltIf_3845_4009 then Nil_v_1065 
   else 
  let val fltPkd_3846_4010 = (getRandomString 5) in 
  let val word_196_2645_4011 = (Str (fltPkd_3846_4010)) in 
  let val fltAppE_3847_4012 = (len_195_2644_4008 - 1) in 
  let val rst_197_2646_4013 = (mkRandomInlineList fltAppE_3847_4012) in (Cons_v_1065 (word_196_2645_4011 , rst_197_2646_4013)) end end end end) end;

fun mkBlogs_layout4 (length_99_2553_3955 , contlen_100_2554_3956, taglen_101_2555_3957) = 
  let val fltIf_3808_3958 = (length_99_2553_3955 <= 0) in 
  (if fltIf_3808_3958 then End 
   else 
  let val fltPkd_3809_3959 = (mkSomeTags taglen_101_2555_3957) in 
  let val tags_102_2556_3960 = (TagList (fltPkd_3809_3959)) in 
  let val fltPkd_3811_3961 = (mkRandomInlineList contlen_100_2554_3956) in 
  let val fltPkd_3810_3962 = (Plain (fltPkd_3811_3961)) in 
  let val content_103_2557_3963 = (Content (fltPkd_3810_3962)) in 
  let val fltAppE_3812_3964 = (length_99_2553_3955 - 1) in 
  let val rst_104_2558_3965 = (mkBlogs_layout4(fltAppE_3812_3964 , contlen_100_2554_3956, taglen_101_2555_3957)) in 
  let val fltPkd_3813_3966 = (getRandomString 5) in 
  let val header_105_2559_3967 = (Header (fltPkd_3813_3966)) in 
  let val fltPrm_3815_3968 = (length_99_2553_3955 mod 10) in 
  let val fltPkd_3814_3969 = (10 - fltPrm_3815_3968) in 
  let val id_106_2560_3970 = (ID (fltPkd_3814_3969)) in 
  let val fltPkd_3816_3971 = (getRandomString 5) in 
  let val author_107_2561_3972 = (Author (fltPkd_3816_3971)) in 
  let val fltPkd_3817_3973 = (getRandomString 5) in 
  let val date_108_2562_3974 = (Date (fltPkd_3817_3973)) in (Layout4 (tags_102_2556_3960 , content_103_2557_3963, rst_104_2558_3965, header_105_2559_3967, id_106_2560_3970, author_107_2561_3972, date_108_2562_3974)) end end end end end end end end end end end end end end end end) end;

fun blogLength (blog_42_2496_3890) = (case blog_42_2496_3890 of End => 0 
  | Layout1 (a_43_2497_3891 , b_44_2498_3892, c_45_2499_3893, d_46_2500_3894, e_47_2501_3895, f_48_2502_3896, rst_49_2503_3897) => 
  let val fltPrm_3800_3898 = (blogLength rst_49_2503_3897) in (1 + fltPrm_3800_3898) end
  | Layout2 (a_50_2504_3899 , b_51_2505_3900, rst_52_2506_3901, c_53_2507_3902, d_54_2508_3903, e_55_2509_3904, f_56_2510_3905) => 
  let val fltPrm_3801_3906 = (blogLength rst_52_2506_3901) in (1 + fltPrm_3801_3906) end
  | Layout3 (a_57_2511_3907 , rst_58_2512_3908, b_59_2513_3909, c_60_2514_3910, d_61_2515_3911, e_62_2516_3912, f_63_2517_3913) => 
  let val fltPrm_3802_3914 = (blogLength rst_58_2512_3908) in (1 + fltPrm_3802_3914) end
  | Layout4 (a_64_2518_3915 , b_65_2519_3916, rst_66_2520_3917, d_67_2521_3918, e_68_2522_3919, f_69_2523_3920, g_70_2524_3921) => 
  let val fltPrm_3803_3922 = (blogLength rst_66_2520_3917) in (1 + fltPrm_3803_3922) end
  | Layout5 (rst_71_2525_3923 , a_72_2526_3924, b_73_2527_3925, c_74_2528_3926, d_75_2529_3927, e_76_2530_3928, f_77_2531_3929) => 
  let val fltPrm_3804_3930 = (blogLength rst_71_2525_3923) in (1 + fltPrm_3804_3930) end
  | Layout6 (a_78_2532_3931 , b_79_2533_3932, c_80_2534_3933, d_81_2535_3934, e_82_2536_3935, rst_83_2537_3936, f_84_2538_3937) => 
  let val fltPrm_3805_3938 = (blogLength rst_83_2537_3936) in (1 + fltPrm_3805_3938) end
  | Layout7 (rst_85_2539_3939 , a_86_2540_3940, b_87_2541_3941, c_88_2542_3942, d_89_2543_3943, e_90_2544_3944, f_91_2545_3945) => 
  let val fltPrm_3806_3946 = (blogLength rst_85_2539_3939) in (1 + fltPrm_3806_3946) end
  | Layout8 (a_92_2546_3947 , rst_93_2547_3948, b_94_2548_3949, c_95_2549_3950, d_96_2550_3951, e_97_2551_3952, f_98_2552_3953) => 
  let val fltPrm_3807_3954 = (blogLength rst_93_2547_3948) in (1 + fltPrm_3807_3954) end);

fun searchBlogTags (keyword_39_2493_3887 , tags_40_2494_3888) = (case tags_40_2494_3888 of TagList (list_41_2495_3889) => (searchTagList(keyword_39_2493_3887 , list_41_2495_3889)));

fun emphasizeBlogContent (keyword_36_2490_3883 , oldContent_37_2491_3884) = (case oldContent_37_2491_3884 of Content (block_38_2492_3885) => 
  let val fltPkd_3799_3886 = (emphasizeKeywordInBlock(keyword_36_2490_3883 , block_38_2492_3885)) in (Content (fltPkd_3799_3886)) end);

fun emphKeywordInTag (keyword_24_2478_3871 , blogs_25_2479_3872) = (case blogs_25_2479_3872 of End => End
  | Layout1 (a, b, c, d, e, f, g) => Layout1 (a, b, c, d, e, f, g)
  | Layout2 (a, b, c, d, e, f, g) => Layout2 (a, b, c, d, e, f, g)
  | Layout3 (a, b, c, d, e, f, g) => Layout3 (a, b, c, d, e, f, g)
  | Layout5 (a, b, c, d, e, f, g) => Layout5 (a, b, c, d, e, f, g)
  | Layout6 (a, b, c, d, e, f, g) => Layout6 (a, b, c, d, e, f, g)
  | Layout7 (a, b, c, d, e, f, g) => Layout7 (a, b, c, d, e, f, g)
  | Layout8 (a, b, c, d, e, f, g) => Layout8 (a, b, c, d, e, f, g)
  | Layout4 (tags_26_2480_3873 , content_27_2481_3874, rst_28_2482_3875, header_29_2483_3876, id_30_2484_3877, author_31_2485_3878, date_32_2486_3879) => 
  let val present_33_2487_3880 = (searchBlogTags(keyword_24_2478_3871 , tags_26_2480_3873)) in 
  let val newContent_34_2488_3881 = (emphasizeBlogContent(keyword_24_2478_3871 , content_27_2481_3874)) in 
  let val newRst_35_2489_3882 = (emphKeywordInTag(keyword_24_2478_3871 , rst_28_2482_3875)) in (Layout4 (tags_26_2480_3873 , newContent_34_2488_3881, newRst_35_2489_3882, header_29_2483_3876, id_30_2484_3877, author_31_2485_3878, date_32_2486_3879)) end end end);
val _ = ((fn true => print "True" | false => print "False") 
  let val blogs_18_2473_3864 = (mkBlogs_layout4(400000 , 500, 5)) in 
  let val vec_15_19_2474_3865 = ((fn internal__ => CharArraySlice.full(CharArray.array(internal__, #"0"))) 1) in 
  let val internal__20_2475_3866 = let val _ = (CharArraySlice.update(vec_15_19_2474_3865 , 0, #"a")) in vec_15_19_2474_3865 end in 
  let val newblgs_22_2477_3868 = (emphKeywordInTag(vec_15_19_2474_3865 , blogs_18_2473_3864)) in 
  let val fltPrm_3797_3869 = (blogLength newblgs_22_2477_3868) in 
  let val fltPrm_3798_3870 = (blogLength blogs_18_2473_3864) in (fltPrm_3797_3869 = fltPrm_3798_3870) end end end end end end);
val _ = print "\n"
