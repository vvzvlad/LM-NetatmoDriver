LJ 0@/usr/share/lua/user/netatmo_station_driver.luas  .L  T   T      T 4  7 > '   T'  'ÿ T'ÿ4  7 > T4  7 > 'd  T'd '   T'  H abs	ceil	mathÈ						max  /min  /reverse  /data  / ª #E·¨%  % 2  2  )	    T
)   T
4
 % >
%
   %  %  %  $

+  73	 :
3 
 ::4 77
 >:4 77 >:>  T%  % $	  T	4 	 >4     >G  4 74 7 > = 7  T4 %  $>%  % $2  +  73 :
3  ::4 77 >:4 77 >:>  T%  % $	  T	4 	 >4     >G  4 74 7 > = 7 7!87":74$ 'X '8 ) 7 7!87#>:#77 7!87%:%' 7 7!87& ' I¶7 7!87&67'( T*7 7!87&67":)7)4$ 'Z ' 2 )! 7" 7"!"8""7"&"6""7"*">:*7)4$ 'Ô'  )! 7" 7"!"8""7"&"6""7"+">:+7)7 7!87&67%:%T, T*7 7!87&67":-7-4$ 'Z ' 2 )! 7" 7"!"8""7"&"6""7"*">:*7-4$ 'Ô'  )! 7" 7"!"8""7"&"6""7"+">:+7-7 7!87&67%:%TW. T*7 7!87&67":/7/4$ 'Z ' 2 )! 7" 7"!"8""7"&"6""7"*">:*7/4$ 'Ô'  )! 7" 7"!"8""7"&"6""7"+">:+7/7 7!87&67%:%T+0 T)7 7!87&67":1714$ 'Z ' 2 )! 7" 7"!"8""7"&"6""7"*">:*714$ 'Ô'  )! 7" 7"!"8""7"&"6""7"+">:+717 7!87&67%:%KJ2  :2727 747576:3727 747578:7727 74757::97273	 T72%; :3T7273	 T72%< :37277	 T72%= :7T7277	 T72%> :7T7277	 T72%? :7T7277	 T72%@ :7T7277	 T72%A :77279	 T72%B :9T7279	 T72%C :9T7279	 T72%D :9	  F  À	mmHg	inHg	mbar	knotbeaufortmsmphkphimperialmetricpressureunitpressure_unitwindunitwind_unit	unitadministrative	userunit_systeminformation	rainNAModule3	windNAModule2outdoor_2NAModule4battery_vprf_statusoutdoor_1NAModule1	typemodulesmodule_namenormalizewifi_statusdashboard_datadevices	bodyindoor"netatmo get data error code:  Content-Type&application/x-www-form-urlencoded protocol
tlsv1method	POST&app_type=app_stationaccess_token=netatmo token: access_tokenconcatdecode	json:, set netatmo_debug to true for detaled output in lognetatmo auth error code: 
table	sinkstringsource
ltn12headersContent-Length Content-Type&application/x-www-form-urlencodedurl protocol
tlsv1method	POSTrequest&password=&username=&client_secret=#grant_type=password&client_id=netatmo startlog0https://api.netatmo.net/api/getstationsdata)https://api.netatmo.net/oauth2/token 	    !!"""######%((((((()**+++++..../00024778999999::::::1>>????@@AAABBBBBBDGGGGGGGIIIIIJJJJJJJJJJJKKKKKKMMMMMMMMNNNNNNOOPPPPPPPQQQQQQQQQQQQQRRRRRRRRRRRRRSSSSSSSSSTTUUUUUUUVVVVVVVVVVVVVWWWWWWWWWWWWWXXXXXXXXXYYZZZZZZZ[[[[[[[[[[[[[\\\\\\\\\\\\\]]]]]]]]]^^_______`````````````aaaaaaaaaaaaabbbbbbbbMffgggggghhhhhhiiiiiikkkkllllmmmmnnnrrrrssssttttuuuuvvvvwwwwxxxxyyyyzzzz{{{~~~~https client_id  ¸client_secret  ¸username  ¸password  ¸netatmo_debug  ¸request_token_url ¶request_device_list µresponse_body ´data_remastered ³netatmo_error ²request_body ¡body code  hdrs  stat  response_decode óaccess_token òrequest_body çresponse_body æbody Ñcode  Ñhdrs  Ñstat  Ñresponse_decode ¸· · ·i µm_type ¯     4   % > 4   % > 5  4   % > 1 5 1 5 0  G  netatmo normalize ssl.https	json
ltn12requirehttps   