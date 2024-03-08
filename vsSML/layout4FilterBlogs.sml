datatype dat_Inline = Str of (CharArraySlice.slice) | Emph of ( dat_PList_v_1084)| Space 
and dat_Block = Plain of ( dat_PList_v_1084) | Null
and dat_BlogHeader = Header of (CharArraySlice.slice)
and dat_BlogId = ID of (int)
and dat_BlogAuthor = Author of (CharArraySlice.slice)
and dat_BlogDate = Date of (CharArraySlice.slice)
and dat_BlogContent = Content of ( dat_Block)
and dat_BlogTags = TagList of ( dat_PList_v_1085)
and dat_Blog = End | Layout1 of ( dat_BlogHeader  *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogContent *  dat_BlogTags *  dat_Blog)| Layout2 of ( dat_BlogContent  *  dat_BlogTags *  dat_Blog *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout3 of ( dat_BlogTags  *  dat_Blog *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout4 of ( dat_BlogTags  *  dat_BlogContent *  dat_Blog *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout5 of ( dat_Blog  *  dat_BlogTags *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate)| Layout6 of ( dat_BlogHeader  *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogContent *  dat_Blog *  dat_BlogTags)| Layout7 of ( dat_Blog  *  dat_BlogContent *  dat_BlogHeader *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogTags)| Layout8 of ( dat_BlogContent  *  dat_Blog *  dat_BlogId *  dat_BlogAuthor *  dat_BlogDate *  dat_BlogHeader *  dat_BlogTags)
and dat_PList_v_1085 = Nil_v_1085 | Cons_v_1085 of (CharArraySlice.slice  *  dat_PList_v_1085)
and dat_PList_v_1084 = Nil_v_1084 | Cons_v_1084 of ( dat_Inline  *  dat_PList_v_1084)
and dat_PList_v_1087 = Nil_v_1087 | Cons_v_1087 of ( dat_Block  *  dat_PList_v_1087) ;

fun internal_print_PList_v_1085 (arg_2432_3657_4687) = (case arg_2432_3657_4687 of Nil_v_1085 => 
  let val wildcard_2433_3658_4688 = (print "(Nil_v_1085") in 
  let val wildcard_2434_3659_4689 = (print ")") in () end end 
  | Cons_v_1085 (x_2435_3660_4690 , x_2436_3661_4691) => 
  let val wildcard_2439_3662_4692 = (print "(Cons_v_1085") in 
  let val wildcard_2442_3663_4693 = (print " ") in 
  let val y_2437_3664_4694 = (print "Vector") in 
  let val wildcard_2441_3665_4695 = (print " ") in 
  let val y_2438_3666_4696 = (internal_print_PList_v_1085 x_2436_3661_4691) in 
  let val wildcard_2440_3667_4697 = (print ")") in () end end end end end end);

fun internal_traverse_PList_v_1085 (arg_2427_3653_4683) = (case arg_2427_3653_4683 of Nil_v_1085 => () 
  | Cons_v_1085 (x_2428_3654_4684 , x_2429_3655_4685) => 
  let val y_2431_3656_4686 = (internal_traverse_PList_v_1085 x_2429_3655_4685) in () end);

fun internal_copy_without_ptrs_PList_v_1085 (arg_2422_3648_4678) = (case arg_2422_3648_4678 of Nil_v_1085 => Nil_v_1085 
  | Cons_v_1085 (x_2423_3649_4679 , x_2424_3650_4680) => 
  let val y_2426_3652_4682 = (internal_copy_without_ptrs_PList_v_1085 x_2424_3650_4680) in (Cons_v_1085 (x_2423_3649_4679 , y_2426_3652_4682)) end);

fun internal_copy_PList_v_1085 (arg_2417_3643_4673) = (case arg_2417_3643_4673 of Nil_v_1085 => Nil_v_1085 
  | Cons_v_1085 (x_2418_3644_4674 , x_2419_3645_4675) => 
  let val y_2421_3647_4677 = (internal_copy_PList_v_1085 x_2419_3645_4675) in (Cons_v_1085 (x_2418_3644_4674 , y_2421_3647_4677)) end);

fun internal_print_BlogTags (arg_1885_3111_4141) = (case arg_1885_3111_4141 of TagList (x_1886_3112_4142) => 
  let val wildcard_1888_3113_4143 = (print "(TagList") in 
  let val wildcard_1890_3114_4144 = (print " ") in 
  let val y_1887_3115_4145 = (internal_print_PList_v_1085 x_1886_3112_4142) in 
  let val wildcard_1889_3116_4146 = (print ")") in () end end end end);

fun internal_traverse_BlogTags (arg_1882_3108_4138) = (case arg_1882_3108_4138 of TagList (x_1883_3109_4139) => 
  let val y_1884_3110_4140 = (internal_traverse_PList_v_1085 x_1883_3109_4139) in () end);

fun internal_copy_without_ptrs_BlogTags (arg_1879_3105_4135) = (case arg_1879_3105_4135 of TagList (x_1880_3106_4136) => 
  let val y_1881_3107_4137 = (internal_copy_without_ptrs_PList_v_1085 x_1880_3106_4136) in (TagList (y_1881_3107_4137)) end);

fun internal_copy_BlogTags (arg_1876_3102_4132) = (case arg_1876_3102_4132 of TagList (x_1877_3103_4133) => 
  let val y_1878_3104_4134 = (internal_copy_PList_v_1085 x_1877_3103_4133) in (TagList (y_1878_3104_4134)) end);

fun internal_print_BlogDate (arg_1855_3081_4111) = (case arg_1855_3081_4111 of Date (x_1856_3082_4112) => 
  let val wildcard_1858_3083_4113 = (print "(Date") in 
  let val wildcard_1860_3084_4114 = (print " ") in 
  let val y_1857_3085_4115 = (print "Vector") in 
  let val wildcard_1859_3086_4116 = (print ")") in () end end end end);

fun internal_traverse_BlogDate (arg_1852_3079_4109) = (case arg_1852_3079_4109 of Date (x_1853_3080_4110) => ());

fun internal_copy_without_ptrs_BlogDate (arg_1849_3076_4106) = (case arg_1849_3076_4106 of Date (x_1850_3077_4107) => (Date (x_1850_3077_4107)));

fun internal_copy_BlogDate (arg_1846_3073_4103) = (case arg_1846_3073_4103 of Date (x_1847_3074_4104) => (Date (x_1847_3074_4104)));

fun internal_print_BlogAuthor (arg_1840_3067_4097) = (case arg_1840_3067_4097 of Author (x_1841_3068_4098) => 
  let val wildcard_1843_3069_4099 = (print "(Author") in 
  let val wildcard_1845_3070_4100 = (print " ") in 
  let val y_1842_3071_4101 = (print "Vector") in 
  let val wildcard_1844_3072_4102 = (print ")") in () end end end end);

fun internal_traverse_BlogAuthor (arg_1837_3065_4095) = (case arg_1837_3065_4095 of Author (x_1838_3066_4096) => ());

fun internal_copy_without_ptrs_BlogAuthor (arg_1834_3062_4092) = (case arg_1834_3062_4092 of Author (x_1835_3063_4093) => (Author (x_1835_3063_4093)));

fun internal_copy_BlogAuthor (arg_1831_3059_4089) = (case arg_1831_3059_4089 of Author (x_1832_3060_4090) => (Author (x_1832_3060_4090)));

fun internal_print_BlogId (arg_1825_3053_4083) = (case arg_1825_3053_4083 of ID (x_1826_3054_4084) => 
  let val wildcard_1828_3055_4085 = (print "(ID") in 
  let val wildcard_1830_3056_4086 = (print " ") in 
  let val y_1827_3057_4087 = (print(Int.toString(x_1826_3054_4084))) in 
  let val wildcard_1829_3058_4088 = (print ")") in () end end end end);

fun internal_traverse_BlogId (arg_1822_3051_4081) = (case arg_1822_3051_4081 of ID (x_1823_3052_4082) => ());

fun internal_copy_without_ptrs_BlogId (arg_1819_3048_4078) = (case arg_1819_3048_4078 of ID (x_1820_3049_4079) => (ID (x_1820_3049_4079)));

fun internal_copy_BlogId (arg_1816_3045_4075) = (case arg_1816_3045_4075 of ID (x_1817_3046_4076) => (ID (x_1817_3046_4076)));

fun internal_print_BlogHeader (arg_1810_3039_4069) = (case arg_1810_3039_4069 of Header (x_1811_3040_4070) => 
  let val wildcard_1813_3041_4071 = (print "(Header") in 
  let val wildcard_1815_3042_4072 = (print " ") in 
  let val y_1812_3043_4073 = (print "Vector") in 
  let val wildcard_1814_3044_4074 = (print ")") in () end end end end);

fun internal_traverse_BlogHeader (arg_1807_3037_4067) = (case arg_1807_3037_4067 of Header (x_1808_3038_4068) => ());

fun internal_copy_without_ptrs_BlogHeader (arg_1804_3034_4064) = (case arg_1804_3034_4064 of Header (x_1805_3035_4065) => (Header (x_1805_3035_4065)));

fun internal_copy_BlogHeader (arg_1801_3031_4061) = (case arg_1801_3031_4061 of Header (x_1802_3032_4062) => (Header (x_1802_3032_4062)));

fun internal_print_Inline (arg_1771_3001_4031) = (case arg_1771_3001_4031 of Str (x_1772_3002_4032) => 
  let val wildcard_1774_3003_4033 = (print "(Str") in 
  let val wildcard_1776_3004_4034 = (print " ") in 
  let val y_1773_3005_4035 = (print "Vector") in 
  let val wildcard_1775_3006_4036 = (print ")") in () end end end end 
  | Emph (x_1777_3007_4037) => 
  let val wildcard_1779_3008_4038 = (print "(Emph") in 
  let val wildcard_1781_3009_4039 = (print " ") in 
  let val y_1778_3010_4040 = (internal_print_PList_v_1084 x_1777_3007_4037) in 
  let val wildcard_1780_3011_4041 = (print ")") in () end end end end
  | Space => 
  let val wildcard_1782_3012_4042 = (print "(Space") in 
  let val wildcard_1783_3013_4043 = (print ")") in () end end)
and internal_print_PList_v_1084 (arg_2458_3683_4713) = (case arg_2458_3683_4713 of Nil_v_1084 => 
  let val wildcard_2459_3684_4714 = (print "(Nil_v_1084") in 
  let val wildcard_2460_3685_4715 = (print ")") in () end end 
  | Cons_v_1084 (x_2461_3686_4716 , x_2462_3687_4717) => 
  let val wildcard_2465_3688_4718 = (print "(Cons_v_1084") in 
  let val wildcard_2468_3689_4719 = (print " ") in 
  let val y_2463_3690_4720 = (internal_print_Inline x_2461_3686_4716) in 
  let val wildcard_2467_3691_4721 = (print " ") in 
  let val y_2464_3692_4722 = (internal_print_PList_v_1084 x_2462_3687_4717) in 
  let val wildcard_2466_3693_4723 = (print ")") in () end end end end end end);

fun internal_print_Block (arg_1793_3023_4053) = (case arg_1793_3023_4053 of Plain (x_1794_3024_4054) => 
  let val wildcard_1796_3025_4055 = (print "(Plain") in 
  let val wildcard_1798_3026_4056 = (print " ") in 
  let val y_1795_3027_4057 = (internal_print_PList_v_1084 x_1794_3024_4054) in 
  let val wildcard_1797_3028_4058 = (print ")") in () end end end end 
  | Null => 
  let val wildcard_1799_3029_4059 = (print "(Null") in 
  let val wildcard_1800_3030_4060 = (print ")") in () end end);

fun internal_print_BlogContent (arg_1870_3096_4126) = (case arg_1870_3096_4126 of Content (x_1871_3097_4127) => 
  let val wildcard_1873_3098_4128 = (print "(Content") in 
  let val wildcard_1875_3099_4129 = (print " ") in 
  let val y_1872_3100_4130 = (internal_print_Block x_1871_3097_4127) in 
  let val wildcard_1874_3101_4131 = (print ")") in () end end end end);

fun internal_print_Blog (arg_2230_3456_4486) = (case arg_2230_3456_4486 of End => 
  let val wildcard_2231_3457_4487 = (print "(End") in 
  let val wildcard_2232_3458_4488 = (print ")") in () end end 
  | Layout1 (x_2233_3459_4489 , x_2234_3460_4490, x_2235_3461_4491, x_2236_3462_4492, x_2237_3463_4493, x_2238_3464_4494, x_2239_3465_4495) => 
  let val wildcard_2247_3466_4496 = (print "(Layout1") in 
  let val wildcard_2255_3467_4497 = (print " ") in 
  let val y_2240_3468_4498 = (internal_print_BlogHeader x_2233_3459_4489) in 
  let val wildcard_2254_3469_4499 = (print " ") in 
  let val y_2241_3470_4500 = (internal_print_BlogId x_2234_3460_4490) in 
  let val wildcard_2253_3471_4501 = (print " ") in 
  let val y_2242_3472_4502 = (internal_print_BlogAuthor x_2235_3461_4491) in 
  let val wildcard_2252_3473_4503 = (print " ") in 
  let val y_2243_3474_4504 = (internal_print_BlogDate x_2236_3462_4492) in 
  let val wildcard_2251_3475_4505 = (print " ") in 
  let val y_2244_3476_4506 = (internal_print_BlogContent x_2237_3463_4493) in 
  let val wildcard_2250_3477_4507 = (print " ") in 
  let val y_2245_3478_4508 = (internal_print_BlogTags x_2238_3464_4494) in 
  let val wildcard_2249_3479_4509 = (print " ") in 
  let val y_2246_3480_4510 = (internal_print_Blog x_2239_3465_4495) in 
  let val wildcard_2248_3481_4511 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout2 (x_2256_3482_4512 , x_2257_3483_4513, x_2258_3484_4514, x_2259_3485_4515, x_2260_3486_4516, x_2261_3487_4517, x_2262_3488_4518) => 
  let val wildcard_2270_3489_4519 = (print "(Layout2") in 
  let val wildcard_2278_3490_4520 = (print " ") in 
  let val y_2263_3491_4521 = (internal_print_BlogContent x_2256_3482_4512) in 
  let val wildcard_2277_3492_4522 = (print " ") in 
  let val y_2264_3493_4523 = (internal_print_BlogTags x_2257_3483_4513) in 
  let val wildcard_2276_3494_4524 = (print " ") in 
  let val y_2265_3495_4525 = (internal_print_Blog x_2258_3484_4514) in 
  let val wildcard_2275_3496_4526 = (print " ") in 
  let val y_2266_3497_4527 = (internal_print_BlogHeader x_2259_3485_4515) in 
  let val wildcard_2274_3498_4528 = (print " ") in 
  let val y_2267_3499_4529 = (internal_print_BlogId x_2260_3486_4516) in 
  let val wildcard_2273_3500_4530 = (print " ") in 
  let val y_2268_3501_4531 = (internal_print_BlogAuthor x_2261_3487_4517) in 
  let val wildcard_2272_3502_4532 = (print " ") in 
  let val y_2269_3503_4533 = (internal_print_BlogDate x_2262_3488_4518) in 
  let val wildcard_2271_3504_4534 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout3 (x_2279_3505_4535 , x_2280_3506_4536, x_2281_3507_4537, x_2282_3508_4538, x_2283_3509_4539, x_2284_3510_4540, x_2285_3511_4541) => 
  let val wildcard_2293_3512_4542 = (print "(Layout3") in 
  let val wildcard_2301_3513_4543 = (print " ") in 
  let val y_2286_3514_4544 = (internal_print_BlogTags x_2279_3505_4535) in 
  let val wildcard_2300_3515_4545 = (print " ") in 
  let val y_2287_3516_4546 = (internal_print_Blog x_2280_3506_4536) in 
  let val wildcard_2299_3517_4547 = (print " ") in 
  let val y_2288_3518_4548 = (internal_print_BlogContent x_2281_3507_4537) in 
  let val wildcard_2298_3519_4549 = (print " ") in 
  let val y_2289_3520_4550 = (internal_print_BlogHeader x_2282_3508_4538) in 
  let val wildcard_2297_3521_4551 = (print " ") in 
  let val y_2290_3522_4552 = (internal_print_BlogId x_2283_3509_4539) in 
  let val wildcard_2296_3523_4553 = (print " ") in 
  let val y_2291_3524_4554 = (internal_print_BlogAuthor x_2284_3510_4540) in 
  let val wildcard_2295_3525_4555 = (print " ") in 
  let val y_2292_3526_4556 = (internal_print_BlogDate x_2285_3511_4541) in 
  let val wildcard_2294_3527_4557 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout4 (x_2302_3528_4558 , x_2303_3529_4559, x_2304_3530_4560, x_2305_3531_4561, x_2306_3532_4562, x_2307_3533_4563, x_2308_3534_4564) => 
  let val wildcard_2316_3535_4565 = (print "(Layout4") in 
  let val wildcard_2324_3536_4566 = (print " ") in 
  let val y_2309_3537_4567 = (internal_print_BlogTags x_2302_3528_4558) in 
  let val wildcard_2323_3538_4568 = (print " ") in 
  let val y_2310_3539_4569 = (internal_print_BlogContent x_2303_3529_4559) in 
  let val wildcard_2322_3540_4570 = (print " ") in 
  let val y_2311_3541_4571 = (internal_print_Blog x_2304_3530_4560) in 
  let val wildcard_2321_3542_4572 = (print " ") in 
  let val y_2312_3543_4573 = (internal_print_BlogHeader x_2305_3531_4561) in 
  let val wildcard_2320_3544_4574 = (print " ") in 
  let val y_2313_3545_4575 = (internal_print_BlogId x_2306_3532_4562) in 
  let val wildcard_2319_3546_4576 = (print " ") in 
  let val y_2314_3547_4577 = (internal_print_BlogAuthor x_2307_3533_4563) in 
  let val wildcard_2318_3548_4578 = (print " ") in 
  let val y_2315_3549_4579 = (internal_print_BlogDate x_2308_3534_4564) in 
  let val wildcard_2317_3550_4580 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout5 (x_2325_3551_4581 , x_2326_3552_4582, x_2327_3553_4583, x_2328_3554_4584, x_2329_3555_4585, x_2330_3556_4586, x_2331_3557_4587) => 
  let val wildcard_2339_3558_4588 = (print "(Layout5") in 
  let val wildcard_2347_3559_4589 = (print " ") in 
  let val y_2332_3560_4590 = (internal_print_Blog x_2325_3551_4581) in 
  let val wildcard_2346_3561_4591 = (print " ") in 
  let val y_2333_3562_4592 = (internal_print_BlogTags x_2326_3552_4582) in 
  let val wildcard_2345_3563_4593 = (print " ") in 
  let val y_2334_3564_4594 = (internal_print_BlogContent x_2327_3553_4583) in 
  let val wildcard_2344_3565_4595 = (print " ") in 
  let val y_2335_3566_4596 = (internal_print_BlogHeader x_2328_3554_4584) in 
  let val wildcard_2343_3567_4597 = (print " ") in 
  let val y_2336_3568_4598 = (internal_print_BlogId x_2329_3555_4585) in 
  let val wildcard_2342_3569_4599 = (print " ") in 
  let val y_2337_3570_4600 = (internal_print_BlogAuthor x_2330_3556_4586) in 
  let val wildcard_2341_3571_4601 = (print " ") in 
  let val y_2338_3572_4602 = (internal_print_BlogDate x_2331_3557_4587) in 
  let val wildcard_2340_3573_4603 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout6 (x_2348_3574_4604 , x_2349_3575_4605, x_2350_3576_4606, x_2351_3577_4607, x_2352_3578_4608, x_2353_3579_4609, x_2354_3580_4610) => 
  let val wildcard_2362_3581_4611 = (print "(Layout6") in 
  let val wildcard_2370_3582_4612 = (print " ") in 
  let val y_2355_3583_4613 = (internal_print_BlogHeader x_2348_3574_4604) in 
  let val wildcard_2369_3584_4614 = (print " ") in 
  let val y_2356_3585_4615 = (internal_print_BlogId x_2349_3575_4605) in 
  let val wildcard_2368_3586_4616 = (print " ") in 
  let val y_2357_3587_4617 = (internal_print_BlogAuthor x_2350_3576_4606) in 
  let val wildcard_2367_3588_4618 = (print " ") in 
  let val y_2358_3589_4619 = (internal_print_BlogDate x_2351_3577_4607) in 
  let val wildcard_2366_3590_4620 = (print " ") in 
  let val y_2359_3591_4621 = (internal_print_BlogContent x_2352_3578_4608) in 
  let val wildcard_2365_3592_4622 = (print " ") in 
  let val y_2360_3593_4623 = (internal_print_Blog x_2353_3579_4609) in 
  let val wildcard_2364_3594_4624 = (print " ") in 
  let val y_2361_3595_4625 = (internal_print_BlogTags x_2354_3580_4610) in 
  let val wildcard_2363_3596_4626 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout7 (x_2371_3597_4627 , x_2372_3598_4628, x_2373_3599_4629, x_2374_3600_4630, x_2375_3601_4631, x_2376_3602_4632, x_2377_3603_4633) => 
  let val wildcard_2385_3604_4634 = (print "(Layout7") in 
  let val wildcard_2393_3605_4635 = (print " ") in 
  let val y_2378_3606_4636 = (internal_print_Blog x_2371_3597_4627) in 
  let val wildcard_2392_3607_4637 = (print " ") in 
  let val y_2379_3608_4638 = (internal_print_BlogContent x_2372_3598_4628) in 
  let val wildcard_2391_3609_4639 = (print " ") in 
  let val y_2380_3610_4640 = (internal_print_BlogHeader x_2373_3599_4629) in 
  let val wildcard_2390_3611_4641 = (print " ") in 
  let val y_2381_3612_4642 = (internal_print_BlogId x_2374_3600_4630) in 
  let val wildcard_2389_3613_4643 = (print " ") in 
  let val y_2382_3614_4644 = (internal_print_BlogAuthor x_2375_3601_4631) in 
  let val wildcard_2388_3615_4645 = (print " ") in 
  let val y_2383_3616_4646 = (internal_print_BlogDate x_2376_3602_4632) in 
  let val wildcard_2387_3617_4647 = (print " ") in 
  let val y_2384_3618_4648 = (internal_print_BlogTags x_2377_3603_4633) in 
  let val wildcard_2386_3619_4649 = (print ")") in () end end end end end end end end end end end end end end end end
  | Layout8 (x_2394_3620_4650 , x_2395_3621_4651, x_2396_3622_4652, x_2397_3623_4653, x_2398_3624_4654, x_2399_3625_4655, x_2400_3626_4656) => 
  let val wildcard_2408_3627_4657 = (print "(Layout8") in 
  let val wildcard_2416_3628_4658 = (print " ") in 
  let val y_2401_3629_4659 = (internal_print_BlogContent x_2394_3620_4650) in 
  let val wildcard_2415_3630_4660 = (print " ") in 
  let val y_2402_3631_4661 = (internal_print_Blog x_2395_3621_4651) in 
  let val wildcard_2414_3632_4662 = (print " ") in 
  let val y_2403_3633_4663 = (internal_print_BlogId x_2396_3622_4652) in 
  let val wildcard_2413_3634_4664 = (print " ") in 
  let val y_2404_3635_4665 = (internal_print_BlogAuthor x_2397_3623_4653) in 
  let val wildcard_2412_3636_4666 = (print " ") in 
  let val y_2405_3637_4667 = (internal_print_BlogDate x_2398_3624_4654) in 
  let val wildcard_2411_3638_4668 = (print " ") in 
  let val y_2406_3639_4669 = (internal_print_BlogHeader x_2399_3625_4655) in 
  let val wildcard_2410_3640_4670 = (print " ") in 
  let val y_2407_3641_4671 = (internal_print_BlogTags x_2400_3626_4656) in 
  let val wildcard_2409_3642_4672 = (print ")") in () end end end end end end end end end end end end end end end end);

fun internal_print_PList_v_1087 (arg_2484_3709_4739) = (case arg_2484_3709_4739 of Nil_v_1087 => 
  let val wildcard_2485_3710_4740 = (print "(Nil_v_1087") in 
  let val wildcard_2486_3711_4741 = (print ")") in () end end 
  | Cons_v_1087 (x_2487_3712_4742 , x_2488_3713_4743) => 
  let val wildcard_2491_3714_4744 = (print "(Cons_v_1087") in 
  let val wildcard_2494_3715_4745 = (print " ") in 
  let val y_2489_3716_4746 = (internal_print_Block x_2487_3712_4742) in 
  let val wildcard_2493_3717_4747 = (print " ") in 
  let val y_2490_3718_4748 = (internal_print_PList_v_1087 x_2488_3713_4743) in 
  let val wildcard_2492_3719_4749 = (print ")") in () end end end end end end);

fun internal_traverse_Inline (arg_1766_2997_4027) = (case arg_1766_2997_4027 of Str (x_1767_2998_4028) => () 
  | Emph (x_1769_2999_4029) => 
  let val y_1770_3000_4030 = (internal_traverse_PList_v_1084 x_1769_2999_4029) in () end
  | Space => ())
and internal_traverse_PList_v_1084 (arg_2453_3678_4708) = (case arg_2453_3678_4708 of Nil_v_1084 => () 
  | Cons_v_1084 (x_2454_3679_4709 , x_2455_3680_4710) => 
  let val y_2456_3681_4711 = (internal_traverse_Inline x_2454_3679_4709) in 
  let val y_2457_3682_4712 = (internal_traverse_PList_v_1084 x_2455_3680_4710) in () end end);

fun internal_traverse_Block (arg_1790_3020_4050) = (case arg_1790_3020_4050 of Plain (x_1791_3021_4051) => 
  let val y_1792_3022_4052 = (internal_traverse_PList_v_1084 x_1791_3021_4051) in () end 
  | Null => ());

fun internal_traverse_BlogContent (arg_1867_3093_4123) = (case arg_1867_3093_4123 of Content (x_1868_3094_4124) => 
  let val y_1869_3095_4125 = (internal_traverse_Block x_1868_3094_4124) in () end);

fun internal_traverse_Blog (arg_2117_3343_4373) = (case arg_2117_3343_4373 of End => () 
  | Layout1 (x_2118_3344_4374 , x_2119_3345_4375, x_2120_3346_4376, x_2121_3347_4377, x_2122_3348_4378, x_2123_3349_4379, x_2124_3350_4380) => 
  let val y_2125_3351_4381 = (internal_traverse_BlogHeader x_2118_3344_4374) in 
  let val y_2126_3352_4382 = (internal_traverse_BlogId x_2119_3345_4375) in 
  let val y_2127_3353_4383 = (internal_traverse_BlogAuthor x_2120_3346_4376) in 
  let val y_2128_3354_4384 = (internal_traverse_BlogDate x_2121_3347_4377) in 
  let val y_2129_3355_4385 = (internal_traverse_BlogContent x_2122_3348_4378) in 
  let val y_2130_3356_4386 = (internal_traverse_BlogTags x_2123_3349_4379) in 
  let val y_2131_3357_4387 = (internal_traverse_Blog x_2124_3350_4380) in () end end end end end end end
  | Layout2 (x_2132_3358_4388 , x_2133_3359_4389, x_2134_3360_4390, x_2135_3361_4391, x_2136_3362_4392, x_2137_3363_4393, x_2138_3364_4394) => 
  let val y_2139_3365_4395 = (internal_traverse_BlogContent x_2132_3358_4388) in 
  let val y_2140_3366_4396 = (internal_traverse_BlogTags x_2133_3359_4389) in 
  let val y_2141_3367_4397 = (internal_traverse_Blog x_2134_3360_4390) in 
  let val y_2142_3368_4398 = (internal_traverse_BlogHeader x_2135_3361_4391) in 
  let val y_2143_3369_4399 = (internal_traverse_BlogId x_2136_3362_4392) in 
  let val y_2144_3370_4400 = (internal_traverse_BlogAuthor x_2137_3363_4393) in 
  let val y_2145_3371_4401 = (internal_traverse_BlogDate x_2138_3364_4394) in () end end end end end end end
  | Layout3 (x_2146_3372_4402 , x_2147_3373_4403, x_2148_3374_4404, x_2149_3375_4405, x_2150_3376_4406, x_2151_3377_4407, x_2152_3378_4408) => 
  let val y_2153_3379_4409 = (internal_traverse_BlogTags x_2146_3372_4402) in 
  let val y_2154_3380_4410 = (internal_traverse_Blog x_2147_3373_4403) in 
  let val y_2155_3381_4411 = (internal_traverse_BlogContent x_2148_3374_4404) in 
  let val y_2156_3382_4412 = (internal_traverse_BlogHeader x_2149_3375_4405) in 
  let val y_2157_3383_4413 = (internal_traverse_BlogId x_2150_3376_4406) in 
  let val y_2158_3384_4414 = (internal_traverse_BlogAuthor x_2151_3377_4407) in 
  let val y_2159_3385_4415 = (internal_traverse_BlogDate x_2152_3378_4408) in () end end end end end end end
  | Layout4 (x_2160_3386_4416 , x_2161_3387_4417, x_2162_3388_4418, x_2163_3389_4419, x_2164_3390_4420, x_2165_3391_4421, x_2166_3392_4422) => 
  let val y_2167_3393_4423 = (internal_traverse_BlogTags x_2160_3386_4416) in 
  let val y_2168_3394_4424 = (internal_traverse_BlogContent x_2161_3387_4417) in 
  let val y_2169_3395_4425 = (internal_traverse_Blog x_2162_3388_4418) in 
  let val y_2170_3396_4426 = (internal_traverse_BlogHeader x_2163_3389_4419) in 
  let val y_2171_3397_4427 = (internal_traverse_BlogId x_2164_3390_4420) in 
  let val y_2172_3398_4428 = (internal_traverse_BlogAuthor x_2165_3391_4421) in 
  let val y_2173_3399_4429 = (internal_traverse_BlogDate x_2166_3392_4422) in () end end end end end end end
  | Layout5 (x_2174_3400_4430 , x_2175_3401_4431, x_2176_3402_4432, x_2177_3403_4433, x_2178_3404_4434, x_2179_3405_4435, x_2180_3406_4436) => 
  let val y_2181_3407_4437 = (internal_traverse_Blog x_2174_3400_4430) in 
  let val y_2182_3408_4438 = (internal_traverse_BlogTags x_2175_3401_4431) in 
  let val y_2183_3409_4439 = (internal_traverse_BlogContent x_2176_3402_4432) in 
  let val y_2184_3410_4440 = (internal_traverse_BlogHeader x_2177_3403_4433) in 
  let val y_2185_3411_4441 = (internal_traverse_BlogId x_2178_3404_4434) in 
  let val y_2186_3412_4442 = (internal_traverse_BlogAuthor x_2179_3405_4435) in 
  let val y_2187_3413_4443 = (internal_traverse_BlogDate x_2180_3406_4436) in () end end end end end end end
  | Layout6 (x_2188_3414_4444 , x_2189_3415_4445, x_2190_3416_4446, x_2191_3417_4447, x_2192_3418_4448, x_2193_3419_4449, x_2194_3420_4450) => 
  let val y_2195_3421_4451 = (internal_traverse_BlogHeader x_2188_3414_4444) in 
  let val y_2196_3422_4452 = (internal_traverse_BlogId x_2189_3415_4445) in 
  let val y_2197_3423_4453 = (internal_traverse_BlogAuthor x_2190_3416_4446) in 
  let val y_2198_3424_4454 = (internal_traverse_BlogDate x_2191_3417_4447) in 
  let val y_2199_3425_4455 = (internal_traverse_BlogContent x_2192_3418_4448) in 
  let val y_2200_3426_4456 = (internal_traverse_Blog x_2193_3419_4449) in 
  let val y_2201_3427_4457 = (internal_traverse_BlogTags x_2194_3420_4450) in () end end end end end end end
  | Layout7 (x_2202_3428_4458 , x_2203_3429_4459, x_2204_3430_4460, x_2205_3431_4461, x_2206_3432_4462, x_2207_3433_4463, x_2208_3434_4464) => 
  let val y_2209_3435_4465 = (internal_traverse_Blog x_2202_3428_4458) in 
  let val y_2210_3436_4466 = (internal_traverse_BlogContent x_2203_3429_4459) in 
  let val y_2211_3437_4467 = (internal_traverse_BlogHeader x_2204_3430_4460) in 
  let val y_2212_3438_4468 = (internal_traverse_BlogId x_2205_3431_4461) in 
  let val y_2213_3439_4469 = (internal_traverse_BlogAuthor x_2206_3432_4462) in 
  let val y_2214_3440_4470 = (internal_traverse_BlogDate x_2207_3433_4463) in 
  let val y_2215_3441_4471 = (internal_traverse_BlogTags x_2208_3434_4464) in () end end end end end end end
  | Layout8 (x_2216_3442_4472 , x_2217_3443_4473, x_2218_3444_4474, x_2219_3445_4475, x_2220_3446_4476, x_2221_3447_4477, x_2222_3448_4478) => 
  let val y_2223_3449_4479 = (internal_traverse_BlogContent x_2216_3442_4472) in 
  let val y_2224_3450_4480 = (internal_traverse_Blog x_2217_3443_4473) in 
  let val y_2225_3451_4481 = (internal_traverse_BlogId x_2218_3444_4474) in 
  let val y_2226_3452_4482 = (internal_traverse_BlogAuthor x_2219_3445_4475) in 
  let val y_2227_3453_4483 = (internal_traverse_BlogDate x_2220_3446_4476) in 
  let val y_2228_3454_4484 = (internal_traverse_BlogHeader x_2221_3447_4477) in 
  let val y_2229_3455_4485 = (internal_traverse_BlogTags x_2222_3448_4478) in () end end end end end end end);

fun internal_traverse_PList_v_1087 (arg_2479_3704_4734) = (case arg_2479_3704_4734 of Nil_v_1087 => () 
  | Cons_v_1087 (x_2480_3705_4735 , x_2481_3706_4736) => 
  let val y_2482_3707_4737 = (internal_traverse_Block x_2480_3705_4735) in 
  let val y_2483_3708_4738 = (internal_traverse_PList_v_1087 x_2481_3706_4736) in () end end);

fun internal_copy_without_ptrs_Inline (arg_1761_2992_4022) = (case arg_1761_2992_4022 of Str (x_1762_2993_4023) => (Str (x_1762_2993_4023)) 
  | Emph (x_1764_2995_4025) => 
  let val y_1765_2996_4026 = (internal_copy_without_ptrs_PList_v_1084 x_1764_2995_4025) in (Emph (y_1765_2996_4026)) end
  | Space => Space)
and internal_copy_without_ptrs_PList_v_1084 (arg_2448_3673_4703) = (case arg_2448_3673_4703 of Nil_v_1084 => Nil_v_1084 
  | Cons_v_1084 (x_2449_3674_4704 , x_2450_3675_4705) => 
  let val y_2451_3676_4706 = (internal_copy_without_ptrs_Inline x_2449_3674_4704) in 
  let val y_2452_3677_4707 = (internal_copy_without_ptrs_PList_v_1084 x_2450_3675_4705) in (Cons_v_1084 (y_2451_3676_4706 , y_2452_3677_4707)) end end);

fun internal_copy_without_ptrs_Block (arg_1787_3017_4047) = (case arg_1787_3017_4047 of Plain (x_1788_3018_4048) => 
  let val y_1789_3019_4049 = (internal_copy_without_ptrs_PList_v_1084 x_1788_3018_4048) in (Plain (y_1789_3019_4049)) end 
  | Null => Null);

fun internal_copy_without_ptrs_BlogContent (arg_1864_3090_4120) = (case arg_1864_3090_4120 of Content (x_1865_3091_4121) => 
  let val y_1866_3092_4122 = (internal_copy_without_ptrs_Block x_1865_3091_4121) in (Content (y_1866_3092_4122)) end);

fun internal_copy_without_ptrs_Blog (arg_2004_3230_4260) = (case arg_2004_3230_4260 of End => End 
  | Layout1 (x_2005_3231_4261 , x_2006_3232_4262, x_2007_3233_4263, x_2008_3234_4264, x_2009_3235_4265, x_2010_3236_4266, x_2011_3237_4267) => 
  let val y_2012_3238_4268 = (internal_copy_without_ptrs_BlogHeader x_2005_3231_4261) in 
  let val y_2013_3239_4269 = (internal_copy_without_ptrs_BlogId x_2006_3232_4262) in 
  let val y_2014_3240_4270 = (internal_copy_without_ptrs_BlogAuthor x_2007_3233_4263) in 
  let val y_2015_3241_4271 = (internal_copy_without_ptrs_BlogDate x_2008_3234_4264) in 
  let val y_2016_3242_4272 = (internal_copy_without_ptrs_BlogContent x_2009_3235_4265) in 
  let val y_2017_3243_4273 = (internal_copy_without_ptrs_BlogTags x_2010_3236_4266) in 
  let val y_2018_3244_4274 = (internal_copy_without_ptrs_Blog x_2011_3237_4267) in (Layout1 (y_2012_3238_4268 , y_2013_3239_4269, y_2014_3240_4270, y_2015_3241_4271, y_2016_3242_4272, y_2017_3243_4273, y_2018_3244_4274)) end end end end end end end
  | Layout2 (x_2019_3245_4275 , x_2020_3246_4276, x_2021_3247_4277, x_2022_3248_4278, x_2023_3249_4279, x_2024_3250_4280, x_2025_3251_4281) => 
  let val y_2026_3252_4282 = (internal_copy_without_ptrs_BlogContent x_2019_3245_4275) in 
  let val y_2027_3253_4283 = (internal_copy_without_ptrs_BlogTags x_2020_3246_4276) in 
  let val y_2028_3254_4284 = (internal_copy_without_ptrs_Blog x_2021_3247_4277) in 
  let val y_2029_3255_4285 = (internal_copy_without_ptrs_BlogHeader x_2022_3248_4278) in 
  let val y_2030_3256_4286 = (internal_copy_without_ptrs_BlogId x_2023_3249_4279) in 
  let val y_2031_3257_4287 = (internal_copy_without_ptrs_BlogAuthor x_2024_3250_4280) in 
  let val y_2032_3258_4288 = (internal_copy_without_ptrs_BlogDate x_2025_3251_4281) in (Layout2 (y_2026_3252_4282 , y_2027_3253_4283, y_2028_3254_4284, y_2029_3255_4285, y_2030_3256_4286, y_2031_3257_4287, y_2032_3258_4288)) end end end end end end end
  | Layout3 (x_2033_3259_4289 , x_2034_3260_4290, x_2035_3261_4291, x_2036_3262_4292, x_2037_3263_4293, x_2038_3264_4294, x_2039_3265_4295) => 
  let val y_2040_3266_4296 = (internal_copy_without_ptrs_BlogTags x_2033_3259_4289) in 
  let val y_2041_3267_4297 = (internal_copy_without_ptrs_Blog x_2034_3260_4290) in 
  let val y_2042_3268_4298 = (internal_copy_without_ptrs_BlogContent x_2035_3261_4291) in 
  let val y_2043_3269_4299 = (internal_copy_without_ptrs_BlogHeader x_2036_3262_4292) in 
  let val y_2044_3270_4300 = (internal_copy_without_ptrs_BlogId x_2037_3263_4293) in 
  let val y_2045_3271_4301 = (internal_copy_without_ptrs_BlogAuthor x_2038_3264_4294) in 
  let val y_2046_3272_4302 = (internal_copy_without_ptrs_BlogDate x_2039_3265_4295) in (Layout3 (y_2040_3266_4296 , y_2041_3267_4297, y_2042_3268_4298, y_2043_3269_4299, y_2044_3270_4300, y_2045_3271_4301, y_2046_3272_4302)) end end end end end end end
  | Layout4 (x_2047_3273_4303 , x_2048_3274_4304, x_2049_3275_4305, x_2050_3276_4306, x_2051_3277_4307, x_2052_3278_4308, x_2053_3279_4309) => 
  let val y_2054_3280_4310 = (internal_copy_without_ptrs_BlogTags x_2047_3273_4303) in 
  let val y_2055_3281_4311 = (internal_copy_without_ptrs_BlogContent x_2048_3274_4304) in 
  let val y_2056_3282_4312 = (internal_copy_without_ptrs_Blog x_2049_3275_4305) in 
  let val y_2057_3283_4313 = (internal_copy_without_ptrs_BlogHeader x_2050_3276_4306) in 
  let val y_2058_3284_4314 = (internal_copy_without_ptrs_BlogId x_2051_3277_4307) in 
  let val y_2059_3285_4315 = (internal_copy_without_ptrs_BlogAuthor x_2052_3278_4308) in 
  let val y_2060_3286_4316 = (internal_copy_without_ptrs_BlogDate x_2053_3279_4309) in (Layout4 (y_2054_3280_4310 , y_2055_3281_4311, y_2056_3282_4312, y_2057_3283_4313, y_2058_3284_4314, y_2059_3285_4315, y_2060_3286_4316)) end end end end end end end
  | Layout5 (x_2061_3287_4317 , x_2062_3288_4318, x_2063_3289_4319, x_2064_3290_4320, x_2065_3291_4321, x_2066_3292_4322, x_2067_3293_4323) => 
  let val y_2068_3294_4324 = (internal_copy_without_ptrs_Blog x_2061_3287_4317) in 
  let val y_2069_3295_4325 = (internal_copy_without_ptrs_BlogTags x_2062_3288_4318) in 
  let val y_2070_3296_4326 = (internal_copy_without_ptrs_BlogContent x_2063_3289_4319) in 
  let val y_2071_3297_4327 = (internal_copy_without_ptrs_BlogHeader x_2064_3290_4320) in 
  let val y_2072_3298_4328 = (internal_copy_without_ptrs_BlogId x_2065_3291_4321) in 
  let val y_2073_3299_4329 = (internal_copy_without_ptrs_BlogAuthor x_2066_3292_4322) in 
  let val y_2074_3300_4330 = (internal_copy_without_ptrs_BlogDate x_2067_3293_4323) in (Layout5 (y_2068_3294_4324 , y_2069_3295_4325, y_2070_3296_4326, y_2071_3297_4327, y_2072_3298_4328, y_2073_3299_4329, y_2074_3300_4330)) end end end end end end end
  | Layout6 (x_2075_3301_4331 , x_2076_3302_4332, x_2077_3303_4333, x_2078_3304_4334, x_2079_3305_4335, x_2080_3306_4336, x_2081_3307_4337) => 
  let val y_2082_3308_4338 = (internal_copy_without_ptrs_BlogHeader x_2075_3301_4331) in 
  let val y_2083_3309_4339 = (internal_copy_without_ptrs_BlogId x_2076_3302_4332) in 
  let val y_2084_3310_4340 = (internal_copy_without_ptrs_BlogAuthor x_2077_3303_4333) in 
  let val y_2085_3311_4341 = (internal_copy_without_ptrs_BlogDate x_2078_3304_4334) in 
  let val y_2086_3312_4342 = (internal_copy_without_ptrs_BlogContent x_2079_3305_4335) in 
  let val y_2087_3313_4343 = (internal_copy_without_ptrs_Blog x_2080_3306_4336) in 
  let val y_2088_3314_4344 = (internal_copy_without_ptrs_BlogTags x_2081_3307_4337) in (Layout6 (y_2082_3308_4338 , y_2083_3309_4339, y_2084_3310_4340, y_2085_3311_4341, y_2086_3312_4342, y_2087_3313_4343, y_2088_3314_4344)) end end end end end end end
  | Layout7 (x_2089_3315_4345 , x_2090_3316_4346, x_2091_3317_4347, x_2092_3318_4348, x_2093_3319_4349, x_2094_3320_4350, x_2095_3321_4351) => 
  let val y_2096_3322_4352 = (internal_copy_without_ptrs_Blog x_2089_3315_4345) in 
  let val y_2097_3323_4353 = (internal_copy_without_ptrs_BlogContent x_2090_3316_4346) in 
  let val y_2098_3324_4354 = (internal_copy_without_ptrs_BlogHeader x_2091_3317_4347) in 
  let val y_2099_3325_4355 = (internal_copy_without_ptrs_BlogId x_2092_3318_4348) in 
  let val y_2100_3326_4356 = (internal_copy_without_ptrs_BlogAuthor x_2093_3319_4349) in 
  let val y_2101_3327_4357 = (internal_copy_without_ptrs_BlogDate x_2094_3320_4350) in 
  let val y_2102_3328_4358 = (internal_copy_without_ptrs_BlogTags x_2095_3321_4351) in (Layout7 (y_2096_3322_4352 , y_2097_3323_4353, y_2098_3324_4354, y_2099_3325_4355, y_2100_3326_4356, y_2101_3327_4357, y_2102_3328_4358)) end end end end end end end
  | Layout8 (x_2103_3329_4359 , x_2104_3330_4360, x_2105_3331_4361, x_2106_3332_4362, x_2107_3333_4363, x_2108_3334_4364, x_2109_3335_4365) => 
  let val y_2110_3336_4366 = (internal_copy_without_ptrs_BlogContent x_2103_3329_4359) in 
  let val y_2111_3337_4367 = (internal_copy_without_ptrs_Blog x_2104_3330_4360) in 
  let val y_2112_3338_4368 = (internal_copy_without_ptrs_BlogId x_2105_3331_4361) in 
  let val y_2113_3339_4369 = (internal_copy_without_ptrs_BlogAuthor x_2106_3332_4362) in 
  let val y_2114_3340_4370 = (internal_copy_without_ptrs_BlogDate x_2107_3333_4363) in 
  let val y_2115_3341_4371 = (internal_copy_without_ptrs_BlogHeader x_2108_3334_4364) in 
  let val y_2116_3342_4372 = (internal_copy_without_ptrs_BlogTags x_2109_3335_4365) in (Layout8 (y_2110_3336_4366 , y_2111_3337_4367, y_2112_3338_4368, y_2113_3339_4369, y_2114_3340_4370, y_2115_3341_4371, y_2116_3342_4372)) end end end end end end end);

fun internal_copy_without_ptrs_PList_v_1087 (arg_2474_3699_4729) = (case arg_2474_3699_4729 of Nil_v_1087 => Nil_v_1087 
  | Cons_v_1087 (x_2475_3700_4730 , x_2476_3701_4731) => 
  let val y_2477_3702_4732 = (internal_copy_without_ptrs_Block x_2475_3700_4730) in 
  let val y_2478_3703_4733 = (internal_copy_without_ptrs_PList_v_1087 x_2476_3701_4731) in (Cons_v_1087 (y_2477_3702_4732 , y_2478_3703_4733)) end end);

fun internal_copy_Inline (arg_1756_2987_4017) = (case arg_1756_2987_4017 of Str (x_1757_2988_4018) => (Str (x_1757_2988_4018)) 
  | Emph (x_1759_2990_4020) => 
  let val y_1760_2991_4021 = (internal_copy_PList_v_1084 x_1759_2990_4020) in (Emph (y_1760_2991_4021)) end
  | Space => Space)
and internal_copy_PList_v_1084 (arg_2443_3668_4698) = (case arg_2443_3668_4698 of Nil_v_1084 => Nil_v_1084 
  | Cons_v_1084 (x_2444_3669_4699 , x_2445_3670_4700) => 
  let val y_2446_3671_4701 = (internal_copy_Inline x_2444_3669_4699) in 
  let val y_2447_3672_4702 = (internal_copy_PList_v_1084 x_2445_3670_4700) in (Cons_v_1084 (y_2446_3671_4701 , y_2447_3672_4702)) end end);

fun internal_copy_Block (arg_1784_3014_4044) = (case arg_1784_3014_4044 of Plain (x_1785_3015_4045) => 
  let val y_1786_3016_4046 = (internal_copy_PList_v_1084 x_1785_3015_4045) in (Plain (y_1786_3016_4046)) end 
  | Null => Null);

fun internal_copy_BlogContent (arg_1861_3087_4117) = (case arg_1861_3087_4117 of Content (x_1862_3088_4118) => 
  let val y_1863_3089_4119 = (internal_copy_Block x_1862_3088_4118) in (Content (y_1863_3089_4119)) end);

fun internal_copy_Blog (arg_1891_3117_4147) = (case arg_1891_3117_4147 of End => End 
  | Layout1 (x_1892_3118_4148 , x_1893_3119_4149, x_1894_3120_4150, x_1895_3121_4151, x_1896_3122_4152, x_1897_3123_4153, x_1898_3124_4154) => 
  let val y_1899_3125_4155 = (internal_copy_BlogHeader x_1892_3118_4148) in 
  let val y_1900_3126_4156 = (internal_copy_BlogId x_1893_3119_4149) in 
  let val y_1901_3127_4157 = (internal_copy_BlogAuthor x_1894_3120_4150) in 
  let val y_1902_3128_4158 = (internal_copy_BlogDate x_1895_3121_4151) in 
  let val y_1903_3129_4159 = (internal_copy_BlogContent x_1896_3122_4152) in 
  let val y_1904_3130_4160 = (internal_copy_BlogTags x_1897_3123_4153) in 
  let val y_1905_3131_4161 = (internal_copy_Blog x_1898_3124_4154) in (Layout1 (y_1899_3125_4155 , y_1900_3126_4156, y_1901_3127_4157, y_1902_3128_4158, y_1903_3129_4159, y_1904_3130_4160, y_1905_3131_4161)) end end end end end end end
  | Layout2 (x_1906_3132_4162 , x_1907_3133_4163, x_1908_3134_4164, x_1909_3135_4165, x_1910_3136_4166, x_1911_3137_4167, x_1912_3138_4168) => 
  let val y_1913_3139_4169 = (internal_copy_BlogContent x_1906_3132_4162) in 
  let val y_1914_3140_4170 = (internal_copy_BlogTags x_1907_3133_4163) in 
  let val y_1915_3141_4171 = (internal_copy_Blog x_1908_3134_4164) in 
  let val y_1916_3142_4172 = (internal_copy_BlogHeader x_1909_3135_4165) in 
  let val y_1917_3143_4173 = (internal_copy_BlogId x_1910_3136_4166) in 
  let val y_1918_3144_4174 = (internal_copy_BlogAuthor x_1911_3137_4167) in 
  let val y_1919_3145_4175 = (internal_copy_BlogDate x_1912_3138_4168) in (Layout2 (y_1913_3139_4169 , y_1914_3140_4170, y_1915_3141_4171, y_1916_3142_4172, y_1917_3143_4173, y_1918_3144_4174, y_1919_3145_4175)) end end end end end end end
  | Layout3 (x_1920_3146_4176 , x_1921_3147_4177, x_1922_3148_4178, x_1923_3149_4179, x_1924_3150_4180, x_1925_3151_4181, x_1926_3152_4182) => 
  let val y_1927_3153_4183 = (internal_copy_BlogTags x_1920_3146_4176) in 
  let val y_1928_3154_4184 = (internal_copy_Blog x_1921_3147_4177) in 
  let val y_1929_3155_4185 = (internal_copy_BlogContent x_1922_3148_4178) in 
  let val y_1930_3156_4186 = (internal_copy_BlogHeader x_1923_3149_4179) in 
  let val y_1931_3157_4187 = (internal_copy_BlogId x_1924_3150_4180) in 
  let val y_1932_3158_4188 = (internal_copy_BlogAuthor x_1925_3151_4181) in 
  let val y_1933_3159_4189 = (internal_copy_BlogDate x_1926_3152_4182) in (Layout3 (y_1927_3153_4183 , y_1928_3154_4184, y_1929_3155_4185, y_1930_3156_4186, y_1931_3157_4187, y_1932_3158_4188, y_1933_3159_4189)) end end end end end end end
  | Layout4 (x_1934_3160_4190 , x_1935_3161_4191, x_1936_3162_4192, x_1937_3163_4193, x_1938_3164_4194, x_1939_3165_4195, x_1940_3166_4196) => 
  let val y_1941_3167_4197 = (internal_copy_BlogTags x_1934_3160_4190) in 
  let val y_1942_3168_4198 = (internal_copy_BlogContent x_1935_3161_4191) in 
  let val y_1943_3169_4199 = (internal_copy_Blog x_1936_3162_4192) in 
  let val y_1944_3170_4200 = (internal_copy_BlogHeader x_1937_3163_4193) in 
  let val y_1945_3171_4201 = (internal_copy_BlogId x_1938_3164_4194) in 
  let val y_1946_3172_4202 = (internal_copy_BlogAuthor x_1939_3165_4195) in 
  let val y_1947_3173_4203 = (internal_copy_BlogDate x_1940_3166_4196) in (Layout4 (y_1941_3167_4197 , y_1942_3168_4198, y_1943_3169_4199, y_1944_3170_4200, y_1945_3171_4201, y_1946_3172_4202, y_1947_3173_4203)) end end end end end end end
  | Layout5 (x_1948_3174_4204 , x_1949_3175_4205, x_1950_3176_4206, x_1951_3177_4207, x_1952_3178_4208, x_1953_3179_4209, x_1954_3180_4210) => 
  let val y_1955_3181_4211 = (internal_copy_Blog x_1948_3174_4204) in 
  let val y_1956_3182_4212 = (internal_copy_BlogTags x_1949_3175_4205) in 
  let val y_1957_3183_4213 = (internal_copy_BlogContent x_1950_3176_4206) in 
  let val y_1958_3184_4214 = (internal_copy_BlogHeader x_1951_3177_4207) in 
  let val y_1959_3185_4215 = (internal_copy_BlogId x_1952_3178_4208) in 
  let val y_1960_3186_4216 = (internal_copy_BlogAuthor x_1953_3179_4209) in 
  let val y_1961_3187_4217 = (internal_copy_BlogDate x_1954_3180_4210) in (Layout5 (y_1955_3181_4211 , y_1956_3182_4212, y_1957_3183_4213, y_1958_3184_4214, y_1959_3185_4215, y_1960_3186_4216, y_1961_3187_4217)) end end end end end end end
  | Layout6 (x_1962_3188_4218 , x_1963_3189_4219, x_1964_3190_4220, x_1965_3191_4221, x_1966_3192_4222, x_1967_3193_4223, x_1968_3194_4224) => 
  let val y_1969_3195_4225 = (internal_copy_BlogHeader x_1962_3188_4218) in 
  let val y_1970_3196_4226 = (internal_copy_BlogId x_1963_3189_4219) in 
  let val y_1971_3197_4227 = (internal_copy_BlogAuthor x_1964_3190_4220) in 
  let val y_1972_3198_4228 = (internal_copy_BlogDate x_1965_3191_4221) in 
  let val y_1973_3199_4229 = (internal_copy_BlogContent x_1966_3192_4222) in 
  let val y_1974_3200_4230 = (internal_copy_Blog x_1967_3193_4223) in 
  let val y_1975_3201_4231 = (internal_copy_BlogTags x_1968_3194_4224) in (Layout6 (y_1969_3195_4225 , y_1970_3196_4226, y_1971_3197_4227, y_1972_3198_4228, y_1973_3199_4229, y_1974_3200_4230, y_1975_3201_4231)) end end end end end end end
  | Layout7 (x_1976_3202_4232 , x_1977_3203_4233, x_1978_3204_4234, x_1979_3205_4235, x_1980_3206_4236, x_1981_3207_4237, x_1982_3208_4238) => 
  let val y_1983_3209_4239 = (internal_copy_Blog x_1976_3202_4232) in 
  let val y_1984_3210_4240 = (internal_copy_BlogContent x_1977_3203_4233) in 
  let val y_1985_3211_4241 = (internal_copy_BlogHeader x_1978_3204_4234) in 
  let val y_1986_3212_4242 = (internal_copy_BlogId x_1979_3205_4235) in 
  let val y_1987_3213_4243 = (internal_copy_BlogAuthor x_1980_3206_4236) in 
  let val y_1988_3214_4244 = (internal_copy_BlogDate x_1981_3207_4237) in 
  let val y_1989_3215_4245 = (internal_copy_BlogTags x_1982_3208_4238) in (Layout7 (y_1983_3209_4239 , y_1984_3210_4240, y_1985_3211_4241, y_1986_3212_4242, y_1987_3213_4243, y_1988_3214_4244, y_1989_3215_4245)) end end end end end end end
  | Layout8 (x_1990_3216_4246 , x_1991_3217_4247, x_1992_3218_4248, x_1993_3219_4249, x_1994_3220_4250, x_1995_3221_4251, x_1996_3222_4252) => 
  let val y_1997_3223_4253 = (internal_copy_BlogContent x_1990_3216_4246) in 
  let val y_1998_3224_4254 = (internal_copy_Blog x_1991_3217_4247) in 
  let val y_1999_3225_4255 = (internal_copy_BlogId x_1992_3218_4248) in 
  let val y_2000_3226_4256 = (internal_copy_BlogAuthor x_1993_3219_4249) in 
  let val y_2001_3227_4257 = (internal_copy_BlogDate x_1994_3220_4250) in 
  let val y_2002_3228_4258 = (internal_copy_BlogHeader x_1995_3221_4251) in 
  let val y_2003_3229_4259 = (internal_copy_BlogTags x_1996_3222_4252) in (Layout8 (y_1997_3223_4253 , y_1998_3224_4254, y_1999_3225_4255, y_2000_3226_4256, y_2001_3227_4257, y_2002_3228_4258, y_2003_3229_4259)) end end end end end end end);

fun internal_copy_PList_v_1087 (arg_2469_3694_4724) = (case arg_2469_3694_4724 of Nil_v_1087 => Nil_v_1087 
  | Cons_v_1087 (x_2470_3695_4725 , x_2471_3696_4726) => 
  let val y_2472_3697_4727 = (internal_copy_Block x_2470_3695_4725) in 
  let val y_2473_3698_4728 = (internal_copy_PList_v_1087 x_2471_3696_4726) in (Cons_v_1087 (y_2472_3697_4727 , y_2473_3698_4728)) end end);

fun maxInt (a_410_2820_4007 , b_411_2821_4008) = 
  let val fltIf_3877_4009 = (a_410_2820_4007 > b_411_2821_4008) in 
  (if fltIf_3877_4009 then a_410_2820_4007 
   else b_411_2821_4008) end;

fun cmp (start_330_2772_3976 , end_331_2773_3977, word1_332_2774_3978, word2_333_2775_3979) = 
  let val fltIf_3871_3980 = (start_330_2772_3976 < end_331_2773_3977) in 
  (if fltIf_3871_3980 then 
  let val a_334_2776_3983 = (CharArraySlice.sub(word1_332_2774_3978 , start_330_2772_3976)) in 
  let val b_335_2777_3986 = (CharArraySlice.sub(word2_333_2775_3979 , start_330_2772_3976)) in 
  let val fltIf_3872_3987 = (a_334_2776_3983 = b_335_2777_3986) in 
  let val eq_336_2778_3988 = 
  (if fltIf_3872_3987 then true 
   else false) in 
  let val fltAppE_3873_3989 = (start_330_2772_3976 + 1) in 
  let val recurse_337_2779_3990 = (cmp(fltAppE_3873_3989 , end_331_2773_3977, word1_332_2774_3978, word2_333_2775_3979)) in (eq_336_2778_3988 andalso recurse_337_2779_3990) end end end end end end 
   else true) end;

fun compareWord (word1_338_2780_3991 , word2_339_2781_3992) = 
  let val len1_340_2782_3994 = (CharArraySlice.length word1_338_2780_3991) in 
  let val len2_341_2783_3996 = (CharArraySlice.length word2_339_2781_3992) in 
  let val fltIf_3874_3997 = (len1_340_2782_3994 = len2_341_2783_3996) in 
  let val compare_len_342_2784_3998 = 
  (if fltIf_3874_3997 then true 
   else false) in 
  (if compare_len_342_2784_3998 then (cmp(0 , len1_340_2782_3994, word1_338_2780_3991, word2_339_2781_3992)) 
   else false) end end end end;

fun searchTagList (keyword_326_2768_3970 , taglist_327_2769_3971) = (case taglist_327_2769_3971 of Nil_v_1085 => false 
  | Cons_v_1085 (word_328_2770_3972 , rst_329_2771_3973) => 
  let val fltPrm_3869_3974 = (compareWord(keyword_326_2768_3970 , word_328_2770_3972)) in 
  let val fltPrm_3870_3975 = (searchTagList(keyword_326_2768_3970 , rst_329_2771_3973)) in (fltPrm_3869_3974 orelse fltPrm_3870_3975) end end);

fun mkSomeTags (len_205_2667_3957) = 
  let val fltIf_3864_3958 = (len_205_2667_3957 <= 0) in 
  (if fltIf_3864_3958 then Nil_v_1085 
   else 
  let val vec_220_206_2668_3959 = ((fn internal__ => CharArraySlice.full(CharArray.array(internal__, #"0"))) 1) in 
  let val internal__207_2669_3960 = let val _ = (CharArraySlice.update(vec_220_206_2668_3959 , 0, #"a")) in vec_220_206_2668_3959 end in 
  let val fltAppE_3865_3962 = (len_205_2667_3957 - 1) in 
  let val rst_209_2671_3963 = (mkSomeTags fltAppE_3865_3962) in (Cons_v_1085 (vec_220_206_2668_3959 , rst_209_2671_3963)) end end end end) end;

fun getChar (decimal_67_2534_3931) = 
  let val fltIf_3839_3932 = (decimal_67_2534_3931 = 0) in 
  (if fltIf_3839_3932 then #"a" 
   else 
  let val fltIf_3840_3933 = (decimal_67_2534_3931 = 1) in 
  (if fltIf_3840_3933 then #"b" 
   else 
  let val fltIf_3841_3934 = (decimal_67_2534_3931 = 2) in 
  (if fltIf_3841_3934 then #"c" 
   else 
  let val fltIf_3842_3935 = (decimal_67_2534_3931 = 3) in 
  (if fltIf_3842_3935 then #"d" 
   else 
  let val fltIf_3843_3936 = (decimal_67_2534_3931 = 4) in 
  (if fltIf_3843_3936 then #"e" 
   else 
  let val fltIf_3844_3937 = (decimal_67_2534_3931 = 5) in 
  (if fltIf_3844_3937 then #"f" 
   else 
  let val fltIf_3845_3938 = (decimal_67_2534_3931 = 6) in 
  (if fltIf_3845_3938 then #"g" 
   else 
  let val fltIf_3846_3939 = (decimal_67_2534_3931 = 7) in 
  (if fltIf_3846_3939 then #"h" 
   else 
  let val fltIf_3847_3940 = (decimal_67_2534_3931 = 8) in 
  (if fltIf_3847_3940 then #"i" 
   else 
  let val fltIf_3848_3941 = (decimal_67_2534_3931 = 9) in 
  (if fltIf_3848_3941 then #"j" 
   else 
  let val fltIf_3849_3942 = (decimal_67_2534_3931 = 10) in 
  (if fltIf_3849_3942 then #"k" 
   else 
  let val fltIf_3850_3943 = (decimal_67_2534_3931 = 11) in 
  (if fltIf_3850_3943 then #"l" 
   else 
  let val fltIf_3851_3944 = (decimal_67_2534_3931 = 12) in 
  (if fltIf_3851_3944 then #"m" 
   else 
  let val fltIf_3852_3945 = (decimal_67_2534_3931 = 13) in 
  (if fltIf_3852_3945 then #"n" 
   else 
  let val fltIf_3853_3946 = (decimal_67_2534_3931 = 14) in 
  (if fltIf_3853_3946 then #"o" 
   else 
  let val fltIf_3854_3947 = (decimal_67_2534_3931 = 15) in 
  (if fltIf_3854_3947 then #"p" 
   else 
  let val fltIf_3855_3948 = (decimal_67_2534_3931 = 16) in 
  (if fltIf_3855_3948 then #"q" 
   else 
  let val fltIf_3856_3949 = (decimal_67_2534_3931 = 17) in 
  (if fltIf_3856_3949 then #"r" 
   else 
  let val fltIf_3857_3950 = (decimal_67_2534_3931 = 18) in 
  (if fltIf_3857_3950 then #"s" 
   else 
  let val fltIf_3858_3951 = (decimal_67_2534_3931 = 19) in 
  (if fltIf_3858_3951 then #"t" 
   else 
  let val fltIf_3859_3952 = (decimal_67_2534_3931 = 20) in 
  (if fltIf_3859_3952 then #"u" 
   else 
  let val fltIf_3860_3953 = (decimal_67_2534_3931 = 21) in 
  (if fltIf_3860_3953 then #"v" 
   else 
  let val fltIf_3861_3954 = (decimal_67_2534_3931 = 22) in 
  (if fltIf_3861_3954 then #"w" 
   else 
  let val fltIf_3862_3955 = (decimal_67_2534_3931 = 23) in 
  (if fltIf_3862_3955 then #"x" 
   else 
  let val fltIf_3863_3956 = (decimal_67_2534_3931 = 24) in 
  (if fltIf_3863_3956 then #"y" 
   else #"z") end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end) end;

fun mkChar (val_377_2819_4004) = 
  let val fltPrm_3876_4005 = (Word.toInt (MLton.Random.rand())) in 
  let val fltAppE_3875_4006 = (fltPrm_3876_4005 mod 26) in (getChar fltAppE_3875_4006) end end;

fun generate_loop_1097_1588 (vec_633_2977_4010 , idx_634_2978_4011, end_635_2979_4012) = 
  let val fltIf_3878_4013 = (idx_634_2978_4011 = end_635_2979_4012) in 
  (if fltIf_3878_4013 then vec_633_2977_4010 
   else 
  let val fltPrm_3879_4014 = (mkChar idx_634_2978_4011) in 
  let val vec1_638_2980_4015 = let val _ = (CharArraySlice.update(vec_633_2977_4010 , idx_634_2978_4011, fltPrm_3879_4014)) in vec_633_2977_4010 end in 
  let val fltAppE_3880_4016 = (idx_634_2978_4011 + 1) in (generate_loop_1097_1588(vec1_638_2980_4015 , fltAppE_3880_4016, end_635_2979_4012)) end end end) end;

fun getRandomString (length_376_2818_3999) = 
  let val n__381_2974_3765_4001 = (maxInt(length_376_2818_3999 , 0)) in 
  let val vec_382_2975_3766_4002 = ((fn internal__ => CharArraySlice.full(CharArray.array(internal__, #"0"))) n__381_2974_3765_4001) in 
  let val vec1_383_2976_3767_4003 = (generate_loop_1097_1588(vec_382_2975_3766_4002 , 0, n__381_2974_3765_4001)) in vec1_383_2976_3767_4003 end end end;

fun mkRandomInlineList (len_210_2672_3964) = 
  let val fltIf_3866_3965 = (len_210_2672_3964 <= 0) in 
  (if fltIf_3866_3965 then Nil_v_1084 
   else 
  let val fltPkd_3867_3966 = (getRandomString 5) in 
  let val word_211_2673_3967 = (Str (fltPkd_3867_3966)) in 
  let val fltAppE_3868_3968 = (len_210_2672_3964 - 1) in 
  let val rst_212_2674_3969 = (mkRandomInlineList fltAppE_3868_3968) in (Cons_v_1084 (word_211_2673_3967 , rst_212_2674_3969)) end end end end) end;

fun mkBlogs_layout4 (length_57_2524_3911 , contlen_58_2525_3912, taglen_59_2526_3913) = 
  let val fltIf_3829_3914 = (length_57_2524_3911 <= 0) in 
  (if fltIf_3829_3914 then End 
   else 
  let val fltPkd_3830_3915 = (mkSomeTags taglen_59_2526_3913) in 
  let val tags_60_2527_3916 = (TagList (fltPkd_3830_3915)) in 
  let val fltPkd_3832_3917 = (mkRandomInlineList contlen_58_2525_3912) in 
  let val fltPkd_3831_3918 = (Plain (fltPkd_3832_3917)) in 
  let val content_61_2528_3919 = (Content (fltPkd_3831_3918)) in 
  let val fltAppE_3833_3920 = (length_57_2524_3911 - 1) in 
  let val rst_62_2529_3921 = (mkBlogs_layout4(fltAppE_3833_3920 , contlen_58_2525_3912, taglen_59_2526_3913)) in 
  let val fltPkd_3834_3922 = (getRandomString 5) in 
  let val header_63_2530_3923 = (Header (fltPkd_3834_3922)) in 
  let val fltPrm_3836_3924 = (length_57_2524_3911 mod 10) in 
  let val fltPkd_3835_3925 = (10 - fltPrm_3836_3924) in 
  let val id_64_2531_3926 = (ID (fltPkd_3835_3925)) in 
  let val fltPkd_3837_3927 = (getRandomString 5) in 
  let val author_65_2532_3928 = (Author (fltPkd_3837_3927)) in 
  let val fltPkd_3838_3929 = (getRandomString 5) in 
  let val date_66_2533_3930 = (Date (fltPkd_3838_3929)) in (Layout4 (tags_60_2527_3916 , content_61_2528_3919, rst_62_2529_3921, header_63_2530_3923, id_64_2531_3926, author_65_2532_3928, date_66_2533_3930)) end end end end end end end end end end end end end end end end) end;

fun searchBlogTags (keyword_54_2521_3908 , tags_55_2522_3909) = (case tags_55_2522_3909 of TagList (list_56_2523_3910) => (searchTagList(keyword_54_2521_3908 , list_56_2523_3910)));

fun checkBlogs (keyword_44_2511_3897 , blogs_45_2512_3898) = (case blogs_45_2512_3898 of End => true 
  | Layout1 (a, b, c, d, e, f, g) => false
  | Layout2 (a, b, c, d, e, f, g) => false
  | Layout3 (a, b, c, d, e, f, g) => false
  | Layout5 (a, b, c, d, e, f, g) => false
  | Layout6 (a, b, c, d, e, f, g) => false
  | Layout7 (a, b, c, d, e, f, g) => false
  | Layout8 (a, b, c, d, e, f, g) => false 
  | Layout4 (tags_46_2513_3899 , content_47_2514_3900, rst_48_2515_3901, header_49_2516_3902, id_50_2517_3903, author_51_2518_3904, date_52_2519_3905) => 
  let val present_53_2520_3906 = (searchBlogTags(keyword_44_2511_3897 , tags_46_2513_3899)) in 
  let val fltPrm_3828_3907 = (checkBlogs(keyword_44_2511_3897 , rst_48_2515_3901)) in (present_53_2520_3906 andalso fltPrm_3828_3907) end end);

fun filterByKeywordInTagList (keyword_33_2500_3886 , blogs_34_2501_3887) = (case blogs_34_2501_3887 of End => End 
  | Layout1 (a, b, c, d, e, f, g) => Layout1 (a, b, c, d, e, f, g)
  | Layout2 (a, b, c, d, e, f, g) => Layout2 (a, b, c, d, e, f, g)
  | Layout3 (a, b, c, d, e, f, g) => Layout3 (a, b, c, d, e, f, g)
  | Layout5 (a, b, c, d, e, f, g) => Layout5 (a, b, c, d, e, f, g)
  | Layout6 (a, b, c, d, e, f, g) => Layout6 (a, b, c, d, e, f, g)
  | Layout7 (a, b, c, d, e, f, g) => Layout7 (a, b, c, d, e, f, g)
  | Layout8 (a, b, c, d, e, f, g) => Layout8 (a, b, c, d, e, f, g) 
  | Layout4 (tags_35_2502_3888 , content_36_2503_3889, rst_37_2504_3890, header_38_2505_3891, id_39_2506_3892, author_40_2507_3893, date_41_2508_3894) => 
  let val present_42_2509_3895 = (searchBlogTags(keyword_33_2500_3886 , tags_35_2502_3888)) in 
  (if present_42_2509_3895 then 
  let val newRst_43_2510_3896 = (filterByKeywordInTagList(keyword_33_2500_3886 , rst_37_2504_3890)) in (Layout4 (tags_35_2502_3888 , content_36_2503_3889, newRst_43_2510_3896, header_38_2505_3891, id_39_2506_3892, author_40_2507_3893, date_41_2508_3894)) end 
   else (filterByKeywordInTagList(keyword_33_2500_3886 , rst_37_2504_3890))) end);
val _ = ((fn true => print "True" | false => print "False") 
  let val blogs_27_2495_3881 = (mkBlogs_layout4(1000000 , 500, 5)) in 
  let val vec_24_28_2496_3882 = ((fn internal__ => CharArraySlice.full(CharArray.array(internal__, #"0"))) 1) in 
  let val internal__29_2497_3883 = let val _ = (CharArraySlice.update(vec_24_28_2496_3882 , 0, #"a")) in vec_24_28_2496_3882 end in 
  let val newblgs_31_2499_3885 = (filterByKeywordInTagList(vec_24_28_2496_3882 , blogs_27_2495_3881)) in (checkBlogs(vec_24_28_2496_3882 , newblgs_31_2499_3885)) end end end end);
val _ = print "\n"
