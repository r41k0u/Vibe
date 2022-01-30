extends Node

var time_stamps = [  3.27401361,   3.66875283,   4.08671202,   4.48145125,   4.87619048,   5.27092971,   5.68888889,   6.08362812,   6.47836735,   6.87310658,   7.2678458,    7.68580499,   8.08054422,   8.47528345,   8.87002268,   9.28798186,   9.68272109,  10.07746032,  10.47219955,  10.89015873,  11.28489796,  11.67963719,  12.07437642,  12.46911565,  12.88707483,  13.28181406,  13.67655329,  14.07129252,  14.46603175,  14.88399093,  15.27873016,  15.67346939,  16.06820862,  16.4861678,   16.88090703,  17.27564626,  17.67038549,  18.08834467,  18.4830839,   18.87782313,  19.29578231,  19.69052154,  20.08526077,  20.48,        20.87473923,  21.26947846,  21.68743764,  22.08217687,  22.4769161,   22.87165533,  23.26639456,  23.68435374,  24.07909297,  24.4738322,   24.86857143,  25.28653061,  25.68126984,  26.07600907,  26.4707483,   26.88870748,  27.28344671,  27.67818594,  28.07292517,  28.4676644,   28.86240363,  29.28036281,  29.67510204,  30.06984127,  30.4645805,   30.88253968,  31.27727891,  31.67201814,  32.06675737,  32.4614966,   32.85623583,  33.27419501,  33.66893424,  34.06367347,  34.4584127,   34.85315193,  35.27111111,  35.66585034,  36.06058957,  36.4553288,   36.87328798,  37.26802721,  37.66276644,  38.05750567,  38.47546485,  38.87020408,  39.26494331,  39.65968254,  40.07764172,  40.47238095,  40.86712018,  41.26185941,  41.65659864,  42.07455782,  42.46929705,  42.86403628,  43.28199546,  43.67673469,  44.07147392,  44.46621315,  44.86095238,  45.27891156,  45.67365079,  46.06839002,  46.46312925,  46.85786848,  47.27582766,  47.67056689,  48.06530612,  48.48326531,  48.87800454,  49.27274376,  49.66748299,  50.06222222,  50.48018141,  50.87492063,  51.26965986,  51.66439909,  52.05913832,  52.47709751,  52.87183673,  53.26657596,  53.66131519,  54.07927438,  54.47401361,  54.86875283,  55.26349206,  55.68145125,  56.07619048,  56.47092971,  56.86566893,  57.28362812,  57.67836735,  58.07310658,  58.4678458,   58.88580499,  59.28054422,  59.67528345,  60.07002268,  60.48798186,  60.88272109,  61.27746032,  61.67219955,  62.09015873,  62.48489796,  62.87963719,  63.27437642,  63.66911565,  64.08707483,  64.48181406,  64.87655329,  65.27129252,  65.66603175,  66.08399093,  66.4555102,   66.85024943,  67.26820862,  67.6861678,   68.08090703,  68.47564626,  68.87038549,  69.26512472,  69.65986395,  70.07782313,  70.47256236,  70.86730159,  71.26204082,  71.68,        72.07473923,  72.46947846,  72.86421769,  73.25895692,  73.6769161,   74.07165533,  74.46639456,  74.88435374,  75.27909297,  75.6738322,   76.06857143,  76.46331066,  76.85804989,  77.27600907,  77.6707483,   78.06548753,  78.46022676,  78.87818594,  79.27292517,  79.6676644,   80.06240363,  80.48036281,  80.87510204,  81.26984127,  81.6645805,   82.08253968,  82.47727891,  82.87201814,  83.26675737,  83.68471655,  84.07945578,  84.47419501,  84.86893424,  85.26367347,  85.6584127,   86.07637188,  86.47111111,  86.86585034,  87.26058957,  87.67854875,  88.07328798,  88.46802721,  88.86276644,  89.25750567,  89.67546485,  90.07020408,  90.46494331,  90.88290249,  91.27764172,  91.67238095,  92.06712018,  92.48507937,  92.87981859,  93.27455782,  93.66929705,  94.06403628,  94.45877551,  94.87673469,  95.27147392,  95.66621315,  96.06095238,  96.47891156,  96.87365079,  97.26839002,  97.66312925,  98.05786848,  98.47582766,  98.87056689,  99.26530612,  99.68326531, 100.07800454, 100.47274376, 100.86748299, 101.26222222, 101.65696145, 102.07492063, 102.46965986, 102.88761905, 103.28235828, 103.67709751, 104.07183673, 104.46657596, 104.86131519, 105.27927438, 105.67401361, 106.06875283, 106.46349206, 106.88145125, 107.27619048, 107.67092971, 108.06566893, 108.48362812, 108.87836735, 109.27310658, 109.6678458,  110.06258503, 110.48054422, 110.87528345, 111.27002268, 111.6647619,  112.05950113, 112.47746032, 112.87219955, 113.26693878, 113.68489796, 114.07963719, 114.47437642, 114.86911565, 115.28707483, 115.68181406, 116.07655329, 116.47129252, 116.86603175, 117.26077098, 117.67873016, 118.07346939, 118.49142857, 118.8861678, 119.28090703, 119.67564626, 120.07038549, 120.46512472, 120.8830839, 121.27782313, 121.67256236, 122.09052154, 122.48526077, 122.88, 123.27473923, 123.66947846, 124.08743764, 124.48217687, 124.8769161, 125.29487528, 125.68961451, 126.08435374, 126.47909297, 126.8738322, 127.26857143, 127.66331066, 128.08126984, 128.47600907, 128.8707483, 129.28870748, 129.68344671, 130.07818594, 130.47292517, 130.8676644, 131.28562358, 131.68036281, 132.07510204, 132.46984127, 132.8645805, 133.25931973, 133.67727891, 134.07201814, 134.48997732, 134.88471655, 135.27945578, 135.67419501, 136.06893424, 136.48689342, 136.88163265, 137.27637188, 137.69433107, 138.08907029, 138.48380952, 138.87854875, 139.27328798, 139.66802721, 140.06276644, 140.48072562, 140.87546485, 141.27020408, 141.68816327, 142.08290249, 142.47764172, 142.87238095, 143.26712018, 143.66185941, 144.07981859, 144.47455782, 144.86929705, 145.26403628, 145.68199546, 146.07673469, 146.47147392, 146.86621315, 147.28417234, 147.67891156, 148.07365079, 148.46839002, 148.88634921, 149.28108844, 149.67582766, 150.09378685, 150.48852608, 150.88326531, 151.27800454, 151.67274376, 152.06748299, 152.46222222, 152.88018141, 153.27492063, 153.66965986, 154.08761905, 154.48235828, 154.87709751, 155.27183673, 155.66657596, 156.06131519, 156.47927438, 156.87401361, 157.26875283, 157.66349206, 158.08145125, 158.47619048, 158.87092971, 159.26566893, 159.66040816, 160.07836735, 160.47310658, 160.8678458, 161.28580499, 161.68054422, 162.07528345, 162.47002268, 162.8647619, 163.28272109, 163.67746032, 164.07219955, 164.46693878, 164.88489796, 165.27963719, 165.69759637, 166.0923356,  166.48707483, 166.88181406, 167.27655329, 167.67129252, 168.06603175, 168.48399093, 168.87873016, 169.27346939, 169.66820862, 170.0861678,  170.48090703, 170.87564626, 171.27038549, 171.66512472, 172.05986395, 172.45460317, 172.87256236, 173.26730159, 173.66204082, 174.08,       174.47473923, 174.86947846, 175.26421769, 175.65895692, 176.0769161,  176.47165533, 176.86639456, 177.26113379, 177.67909297, 178.0738322,  178.46857143, 178.86331066, 179.28126984, 179.67600907, 180.0707483,  180.48870748, 180.88344671, 181.27818594, 181.67292517, 182.0676644,  182.46240363, 182.88036281, 183.27510204, 183.66984127, 184.0645805,  184.48253968, 184.87727891, 185.27201814, 185.66675737, 186.0614966,  186.47945578, 186.87419501, 187.26893424, 187.66367347, 188.0584127,  188.47637188, 188.87111111, 189.26585034, 189.66058957, 190.07854875, 190.47328798, 190.86802721, 191.26276644, 191.68072562, 192.07546485, 192.47020408, 192.88816327, 193.28290249, 193.67764172, 194.07238095, 194.46712018, 194.88507937, 195.27981859, 195.67455782, 196.06929705, 196.48725624, 196.88199546, 197.27673469, 197.67147392, 198.08943311, 198.48417234, 198.87891156, 199.27365079, 199.69160998, 200.08634921, 200.48108844, 200.87582766, 201.29378685, 201.68852608, 202.08326531, 202.47800454, 202.87274376, 203.26748299, 203.68544218, 204.08018141, 204.47492063, 204.86965986, 205.28761905, 205.68235828, 206.07709751]

var time_begin
var time_delay
var time
func _ready():
	time_begin = OS.get_ticks_usec()
	time_delay = AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency()

func _process(delta):
	time = (OS.get_ticks_usec() - time_begin) / 1000000.0
	# Compensate for latency.
	time -= time_delay
	# May be below 0 (did not begin yet).
	time = max(0, time)