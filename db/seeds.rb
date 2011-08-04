# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
home = Category.create(:name => 'Home',:position => 1)
givebaq = Category.create(:name => 'GiveBaq',:position => 2)
fashion = Category.create(:name => 'Fashion',:position => 3)
travel = Category.create(:name => 'Travel',:position => 4)
electronics = Category.create(:name => 'Electronics',:position => 5)
events = Category.create(:name => 'Events',:position => 6)
games = Category.create(:name => 'Games',:position => 7)
lifestyle = Category.create(:name => 'Lifestyle',:position => 8)
gift_cards = Category.create(:name => 'Gift Cards',:position => 9)
Country.create({"position"=>43, "name"=>"CHAD", "iso3"=>"TCD", "iso"=>"TD", "id"=>290, "printable_name"=>"Chad", "numcode"=>148, 'map' => 17})
Country.create({"position"=>69, "name"=>"FAROE ISLANDS", "iso3"=>"FRO", "iso"=>"FO", "id"=>316, "printable_name"=>"Faroe Islands", "numcode"=>234, 'map' => 10})
Country.create({"position"=>96, "name"=>"INDIA", "iso3"=>"IND", "iso"=>"IN", "id"=>343, "printable_name"=>"India", "numcode"=>356, 'map' => 22})
Country.create({"position"=>150, "name"=>"NICARAGUA", "iso3"=>"NIC", "iso"=>"NI", "id"=>397, "printable_name"=>"Nicaragua", "numcode"=>558, 'map' => 8})
Country.create({"position"=>176, "name"=>"SAINT LUCIA", "iso3"=>"LCA", "iso"=>"LC", "id"=>423, "printable_name"=>"Saint Lucia", "numcode"=>662})
Country.create({"position"=>70, "name"=>"FIJI", "iso3"=>"FJI", "iso"=>"FJ", "id"=>317, "printable_name"=>"Fiji", "numcode"=>242})
Country.create({"position"=>97, "name"=>"INDONESIA", "iso3"=>"IDN", "iso"=>"ID", "id"=>344, "printable_name"=>"Indonesia", "numcode"=>360, 'map' => 23})
Country.create({"position"=>151, "name"=>"NIGER", "iso3"=>"NER", "iso"=>"NE", "id"=>398, "printable_name"=>"Niger", "numcode"=>562, 'map' => 17})
Country.create({"position"=>177, "name"=>"SAINT PIERRE AND MIQUELON", "iso3"=>"SPM", "iso"=>"PM", "id"=>424, "printable_name"=>"Saint Pierre and Miquelon", "numcode"=>666})
Country.create({"position"=>71, "name"=>"FINLAND", "iso3"=>"FIN", "iso"=>"FI", "id"=>318, "printable_name"=>"Finland", "numcode"=>246, 'map' => 15})
Country.create({"position"=>152, "name"=>"NIGERIA", "iso3"=>"NGA", "iso"=>"NG", "id"=>399, "printable_name"=>"Nigeria", "numcode"=>566, 'map' => 17})
Country.create({"position"=>178, "name"=>"SAINT VINCENT AND THE GRENADINES", "iso3"=>"VCT", "iso"=>"VC", "id"=>425, "printable_name"=>"Saint Vincent and the Grenadines", "numcode"=>670})
Country.create({"position"=>72, "name"=>"FRANCE", "iso3"=>"FRA", "iso"=>"FR", "id"=>319, "printable_name"=>"France", "numcode"=>250, 'map' => 14})
Country.create({"position"=>98, "name"=>"IRAN, ISLAMIC REPUBLIC OF", "iso3"=>"IRN", "iso"=>"IR", "id"=>345, "printable_name"=>"Iran, Islamic Republic of", "numcode"=>364, 'map' => 20})
Country.create({"position"=>153, "name"=>"NIUE", "iso3"=>"NIU", "iso"=>"NU", "id"=>400, "printable_name"=>"Niue", "numcode"=>570})
Country.create({"position"=>179, "name"=>"SAMOA", "iso3"=>"WSM", "iso"=>"WS", "id"=>426, "printable_name"=>"Samoa", "numcode"=>882})
Country.create({"position"=>73, "name"=>"FRENCH GUIANA", "iso3"=>"GUF", "iso"=>"GF", "id"=>320, "printable_name"=>"French Guiana", "numcode"=>254, 'map' => 11})
Country.create({"position"=>99, "name"=>"IRAQ", "iso3"=>"IRQ", "iso"=>"IQ", "id"=>346, "printable_name"=>"Iraq", "numcode"=>368})
Country.create({"position"=>180, "name"=>"SAN MARINO", "iso3"=>"SMR", "iso"=>"SM", "id"=>427, "printable_name"=>"San Marino", "numcode"=>674})
Country.create({"position"=>100, "name"=>"IRELAND", "iso3"=>"IRL", "iso"=>"IE", "id"=>347, "printable_name"=>"Ireland", "numcode"=>372, 'map' => 14})
Country.create({"position"=>181, "name"=>"SAO TOME AND PRINCIPE", "iso3"=>"STP", "iso"=>"ST", "id"=>428, "printable_name"=>"Sao Tome and Principe", "numcode"=>678})
Country.create({"position"=>101, "name"=>"ISRAEL", "iso3"=>"ISR", "iso"=>"IL", "id"=>348, "printable_name"=>"Israel", "numcode"=>376, 'map' => 20})
Country.create({"position"=>182, "name"=>"SAUDI ARABIA", "iso3"=>"SAU", "iso"=>"SA", "id"=>429, "printable_name"=>"Saudi Arabia", "numcode"=>682, 'map' => 20})
Country.create({"position"=>102, "name"=>"ITALY", "iso3"=>"ITA", "iso"=>"IT", "id"=>349, "printable_name"=>"Italy", "numcode"=>380, 'map' => 14})
Country.create({"position"=>183, "name"=>"SENEGAL", "iso3"=>"SEN", "iso"=>"SN", "id"=>430, "printable_name"=>"Senegal", "numcode"=>686, 'map' => 17})
Country.create({"position"=>103, "name"=>"JAMAICA", "iso3"=>"JAM", "iso"=>"JM", "id"=>350, "printable_name"=>"Jamaica", "numcode"=>388})
Country.create({"position"=>104, "name"=>"JAPAN", "iso3"=>"JPN", "iso"=>"JP", "id"=>351, "printable_name"=>"Japan", "numcode"=>392, 'map' => 23})
Country.create({"position"=>105, "name"=>"JORDAN", "iso3"=>"JOR", "iso"=>"JO", "id"=>352, "printable_name"=>"Jordan", "numcode"=>400, 'map' => 20})
Country.create({"position"=>24, "name"=>"BELGIUM", "iso3"=>"BEL", "iso"=>"BE", "id"=>271, "printable_name"=>"Belgium", "numcode"=>56})
Country.create({"position"=>25, "name"=>"BELIZE", "iso3"=>"BLZ", "iso"=>"BZ", "id"=>272, "printable_name"=>"Belize", "numcode"=>84, 'map' => 8})
Country.create({"position"=>106, "name"=>"KAZAKHSTAN", "iso3"=>"KAZ", "iso"=>"KZ", "id"=>353, "printable_name"=>"Kazakhstan", "numcode"=>398})
Country.create({"position"=>214, "name"=>"UGANDA", "iso3"=>"UGA", "iso"=>"UG", "id"=>461, "printable_name"=>"Uganda", "numcode"=>800})
Country.create({"position"=>26, "name"=>"BENIN", "iso3"=>"BEN", "iso"=>"BJ", "id"=>273, "printable_name"=>"Benin", "numcode"=>204})
Country.create({"position"=>107, "name"=>"KENYA", "iso3"=>"KEN", "iso"=>"KE", "id"=>354, "printable_name"=>"Kenya", "numcode"=>404, 'map' => 18})
Country.create({"position"=>215, "name"=>"UKRAINE", "iso3"=>"UKR", "iso"=>"UA", "id"=>462, "printable_name"=>"Ukraine", "numcode"=>804})
Country.create({"position"=>27, "name"=>"BERMUDA", "iso3"=>"BMU", "iso"=>"BM", "id"=>274, "printable_name"=>"Bermuda", "numcode"=>60})
Country.create({"position"=>108, "name"=>"KIRIBATI", "iso3"=>"KIR", "iso"=>"KI", "id"=>355, "printable_name"=>"Kiribati", "numcode"=>296})
Country.create({"position"=>134, "name"=>"MEXICO", "iso3"=>"MEX", "iso"=>"MX", "id"=>381, "printable_name"=>"Mexico", "numcode"=>484, "map" => 6})
Country.create({"position"=>216, "name"=>"UNITED ARAB EMIRATES", "iso3"=>"ARE", "iso"=>"AE", "id"=>463, "printable_name"=>"United Arab Emirates", "numcode"=>784, 'map' => 20})
Country.create({"position"=>135, "name"=>"MICRONESIA, FEDERATED STATES OF", "iso3"=>"FSM", "iso"=>"FM", "id"=>382, "printable_name"=>"Micronesia, Federated States of", "numcode"=>583})
Country.create({"position"=>109, "name"=>"KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF", "iso3"=>"PRK", "iso"=>"KP", "id"=>356, "printable_name"=>"Korea", "numcode"=>408})
Country.create({"position"=>54, "name"=>"CUBA", "iso3"=>"CUB", "iso"=>"CU", "id"=>301, "printable_name"=>"Cuba", "numcode"=>192})
Country.create({"position"=>28, "name"=>"BHUTAN", "iso3"=>"BTN", "iso"=>"BT", "id"=>275, "printable_name"=>"Bhutan", "numcode"=>64})
Country.create({"position"=>217, "name"=>"UNITED KINGDOM", "iso3"=>"GBR", "iso"=>"GB", "id"=>464, "printable_name"=>"United Kingdom", "numcode"=>826, 'map' => 14})
Country.create({"position"=>29, "name"=>"BOLIVIA", "iso3"=>"BOL", "iso"=>"BO", "id"=>276, "printable_name"=>"Bolivia", "numcode"=>68, 'map' => 13})
Country.create({"position"=>55, "name"=>"CYPRUS", "iso3"=>"CYP", "iso"=>"CY", "id"=>302, "printable_name"=>"Cyprus", "numcode"=>196})
Country.create({"position"=>110, "name"=>"KOREA, REPUBLIC OF", "iso3"=>"KOR", "iso"=>"KR", "id"=>357, "printable_name"=>"Korea, Republic of", "numcode"=>410,, 'map' => 23})
Country.create({"position"=>136, "name"=>"MOLDOVA, REPUBLIC OF", "iso3"=>"MDA", "iso"=>"MD", "id"=>383, "printable_name"=>"Moldova, Republic of", "numcode"=>498})
Country.create({"position"=>1, "name"=>"UNITED STATES", "iso3"=>"USA", "iso"=>"US", "id"=>465, "printable_name"=>"United States", "numcode"=>840})
Country.create({"position"=>30, "name"=>"BOSNIA AND HERZEGOVINA", "iso3"=>"BIH", "iso"=>"BA", "id"=>277, "printable_name"=>"Bosnia and Herzegovina", "numcode"=>70})
Country.create({"position"=>56, "name"=>"CZECH REPUBLIC", "iso3"=>"CZE", "iso"=>"CZ", "id"=>303, "printable_name"=>"Czech Republic", "numcode"=>203, 'map' => 14})
Country.create({"position"=>111, "name"=>"KUWAIT", "iso3"=>"KWT", "iso"=>"KW", "id"=>358, "printable_name"=>"Kuwait", "numcode"=>414})
Country.create({"position"=>137, "name"=>"MONACO", "iso3"=>"MCO", "iso"=>"MC", "id"=>384, "printable_name"=>"Monaco", "numcode"=>492})
Country.create({"position"=>219, "name"=>"URUGUAY", "iso3"=>"URY", "iso"=>"UY", "id"=>466, "printable_name"=>"Uruguay", "numcode"=>858, 'map' => 13})
Country.create({"position"=>31, "name"=>"BOTSWANA", "iso3"=>"BWA", "iso"=>"BW", "id"=>278, "printable_name"=>"Botswana", "numcode"=>72, 'map' => 19})
Country.create({"position"=>57, "name"=>"DENMARK", "iso3"=>"DNK", "iso"=>"DK", "id"=>304, "printable_name"=>"Denmark", "numcode"=>208})
Country.create({"position"=>84, "name"=>"GUADELOUPE", "iso3"=>"GLP", "iso"=>"GP", "id"=>331, "printable_name"=>"Guadeloupe", "numcode"=>312})
Country.create({"position"=>112, "name"=>"KYRGYZSTAN", "iso3"=>"KGZ", "iso"=>"KG", "id"=>359, "printable_name"=>"Kyrgyzstan", "numcode"=>417})
Country.create({"position"=>138, "name"=>"MONGOLIA", "iso3"=>"MNG", "iso"=>"MN", "id"=>385, "printable_name"=>"Mongolia", "numcode"=>496})
Country.create({"position"=>164, "name"=>"PHILIPPINES", "iso3"=>"PHL", "iso"=>"PH", "id"=>411, "printable_name"=>"Philippines", "numcode"=>608, 'map' => 23})
Country.create({"position"=>32, "name"=>"BRAZIL", "iso3"=>"BRA", "iso"=>"BR", "id"=>279, "printable_name"=>"Brazil", "numcode"=>76,'map' => 12})
Country.create({"position"=>58, "name"=>"DJIBOUTI", "iso3"=>"DJI", "iso"=>"DJ", "id"=>305, "printable_name"=>"Djibouti", "numcode"=>262, 'map' => 18})
Country.create({"position"=>85, "name"=>"GUAM", "iso3"=>"GUM", "iso"=>"GU", "id"=>332, "printable_name"=>"Guam", "numcode"=>316})
Country.create({"position"=>113, "name"=>"LAO PEOPLE'S DEMOCRATIC REPUBLIC", "iso3"=>"LAO", "iso"=>"LA", "id"=>360, "printable_name"=>"Lao People's Democratic Republic", "numcode"=>418})
Country.create({"position"=>139, "name"=>"MONTSERRAT", "iso3"=>"MSR", "iso"=>"MS", "id"=>386, "printable_name"=>"Montserrat", "numcode"=>500})
Country.create({"position"=>165, "name"=>"PITCAIRN", "iso3"=>"PCN", "iso"=>"PN", "id"=>412, "printable_name"=>"Pitcairn", "numcode"=>612})
Country.create({"position"=>220, "name"=>"UZBEKISTAN", "iso3"=>"UZB", "iso"=>"UZ", "id"=>467, "printable_name"=>"Uzbekistan", "numcode"=>860})
Country.create({"position"=>33, "name"=>"BRUNEI DARUSSALAM", "iso3"=>"BRN", "iso"=>"BN", "id"=>280, "printable_name"=>"Brunei Darussalam", "numcode"=>96})
Country.create({"position"=>59, "name"=>"DOMINICA", "iso3"=>"DMA", "iso"=>"DM", "id"=>306, "printable_name"=>"Dominica", "numcode"=>212})
Country.create({"position"=>86, "name"=>"GUATEMALA", "iso3"=>"GTM", "iso"=>"GT", "id"=>333, "printable_name"=>"Guatemala", "numcode"=>320, 'map' => 8})
Country.create({"position"=>140, "name"=>"MOROCCO", "iso3"=>"MAR", "iso"=>"MA", "id"=>387, "printable_name"=>"Morocco", "numcode"=>504, 'map' => 16})
Country.create({"position"=>166, "name"=>"POLAND", "iso3"=>"POL", "iso"=>"PL", "id"=>413, "printable_name"=>"Poland", "numcode"=>616, 'map' => 14})
Country.create({"position"=>221, "name"=>"VANUATU", "iso3"=>"VUT", "iso"=>"VU", "id"=>468, "printable_name"=>"Vanuatu", "numcode"=>548})
Country.create({"position"=>60, "name"=>"DOMINICAN REPUBLIC", "iso3"=>"DOM", "iso"=>"DO", "id"=>307, "printable_name"=>"Dominican Republic", "numcode"=>214})
Country.create({"position"=>141, "name"=>"MOZAMBIQUE", "iso3"=>"MOZ", "iso"=>"MZ", "id"=>388, "printable_name"=>"Mozambique", "numcode"=>508, 'map' => 19})
Country.create({"position"=>167, "name"=>"PORTUGAL", "iso3"=>"PRT", "iso"=>"PT", "id"=>414, "printable_name"=>"Portugal", "numcode"=>620, 'map' => 14})
Country.create({"position"=>194, "name"=>"SUDAN", "iso3"=>"SDN", "iso"=>"SD", "id"=>441, "printable_name"=>"Sudan", "numcode"=>736, 'map' => 16, 'map' => 18})
Country.create({"position"=>222, "name"=>"VENEZUELA", "iso3"=>"VEN", "iso"=>"VE", "id"=>469, "printable_name"=>"Venezuela", "numcode"=>862, 'map' => 11})
Country.create({"position"=>61, "name"=>"ECUADOR", "iso3"=>"ECU", "iso"=>"EC", "id"=>308, "printable_name"=>"Ecuador", "numcode"=>218, 'map' => 11})
Country.create({"position"=>87, "name"=>"GUINEA", "iso3"=>"GIN", "iso"=>"GN", "id"=>334, "printable_name"=>"Guinea", "numcode"=>324, 'map' => 17})
Country.create({"position"=>142, "name"=>"MYANMAR", "iso3"=>"MMR", "iso"=>"MM", "id"=>389, "printable_name"=>"Myanmar", "numcode"=>104, 'map' => 23})
Country.create({"position"=>168, "name"=>"PUERTO RICO", "iso3"=>"PRI", "iso"=>"PR", "id"=>415, "printable_name"=>"Puerto Rico", "numcode"=>630})
Country.create({"position"=>195, "name"=>"SURINAME", "iso3"=>"SUR", "iso"=>"SR", "id"=>442, "printable_name"=>"Suriname", "numcode"=>740, 'map' => 11})
Country.create({"position"=>223, "name"=>"VIET NAM", "iso3"=>"VNM", "iso"=>"VN", "id"=>470, "printable_name"=>"Viet Nam", "numcode"=>704, 'map' => 23})
Country.create({"position"=>62, "name"=>"EGYPT", "iso3"=>"EGY", "iso"=>"EG", "id"=>309, "printable_name"=>"Egypt", "numcode"=>818, 'map' => 16})
Country.create({"position"=>88, "name"=>"GUINEA-BISSAU", "iso3"=>"GNB", "iso"=>"GW", "id"=>335, "printable_name"=>"Guinea-Bissau", "numcode"=>624, 'map' => 17})
Country.create({"position"=>143, "name"=>"NAMIBIA", "iso3"=>"NAM", "iso"=>"NA", "id"=>390, "printable_name"=>"Namibia", "numcode"=>516, 'map' => 19})
Country.create({"position"=>169, "name"=>"QATAR", "iso3"=>"QAT", "iso"=>"QA", "id"=>416, "printable_name"=>"Qatar", "numcode"=>634})
Country.create({"position"=>196, "name"=>"SVALBARD AND JAN MAYEN", "iso3"=>"SJM", "iso"=>"SJ", "id"=>443, "printable_name"=>"Svalbard and Jan Mayen", "numcode"=>744})
Country.create({"position"=>63, "name"=>"EL SALVADOR", "iso3"=>"SLV", "iso"=>"SV", "id"=>310, "printable_name"=>"El Salvador", "numcode"=>222, 'map' => 8})
Country.create({"position"=>89, "name"=>"GUYANA", "iso3"=>"GUY", "iso"=>"GY", "id"=>336, "printable_name"=>"Guyana", "numcode"=>328, 'map' => 11})
Country.create({"position"=>170, "name"=>"REUNION", "iso3"=>"REU", "iso"=>"RE", "id"=>417, "printable_name"=>"Reunion", "numcode"=>638})
Country.create({"position"=>90, "name"=>"HAITI", "iso3"=>"HTI", "iso"=>"HT", "id"=>337, "printable_name"=>"Haiti", "numcode"=>332})
Country.create({"position"=>171, "name"=>"ROMANIA", "iso3"=>"ROM", "iso"=>"RO", "id"=>418, "printable_name"=>"Romania", "numcode"=>642, 'map' => 14})
Country.create({"position"=>197, "name"=>"SWAZILAND", "iso3"=>"SWZ", "iso"=>"SZ", "id"=>444, "printable_name"=>"Swaziland", "numcode"=>748, 'map' => 19})
Country.create({"position"=>91, "name"=>"HOLY SEE (VATICAN CITY STATE)", "iso3"=>"VAT", "iso"=>"VA", "id"=>338, "printable_name"=>"Holy See (Vatican City State)", "numcode"=>336})
Country.create({"position"=>172, "name"=>"RUSSIAN FEDERATION", "iso3"=>"RUS", "iso"=>"RU", "id"=>419, "printable_name"=>"Russian Federation", "numcode"=>643, 'map' => 21})
Country.create({"position"=>198, "name"=>"SWEDEN", "iso3"=>"SWE", "iso"=>"SE", "id"=>445, "printable_name"=>"Sweden", "numcode"=>752, 'map' => 15})
Country.create({"position"=>92, "name"=>"HONDURAS", "iso3"=>"HND", "iso"=>"HN", "id"=>339, "printable_name"=>"Honduras", "numcode"=>340, 'map' => 8})
Country.create({"position"=>173, "name"=>"RWANDA", "iso3"=>"RWA", "iso"=>"RW", "id"=>420, "printable_name"=>"Rwanda", "numcode"=>646, 'map' => 18})
Country.create({"position"=>199, "name"=>"SWITZERLAND", "iso3"=>"CHE", "iso"=>"CH", "id"=>446, "printable_name"=>"Switzerland", "numcode"=>756, 'map' => 14})
Country.create({"position"=>93, "name"=>"HONG KONG", "iso3"=>"HKG", "iso"=>"HK", "id"=>340, "printable_name"=>"Hong Kong", "numcode"=>344})
Country.create({"position"=>200, "name"=>"SYRIAN ARAB REPUBLIC", "iso3"=>"SYR", "iso"=>"SY", "id"=>447, "printable_name"=>"Syrian Arab Republic", "numcode"=>760, 'map' => 20})
Country.create({"position"=>201, "name"=>"TAIWAN, PROVINCE OF CHINA", "iso3"=>"TWN", "iso"=>"TW", "id"=>448, "printable_name"=>"Taiwan, Province of China", "numcode"=>158})
Country.create({"position"=>202, "name"=>"TAJIKISTAN", "iso3"=>"TJK", "iso"=>"TJ", "id"=>449, "printable_name"=>"Tajikistan", "numcode"=>762})
Country.create({"position"=>203, "name"=>"TANZANIA, UNITED REPUBLIC OF", "iso3"=>"TZA", "iso"=>"TZ", "id"=>450, "printable_name"=>"Tanzania, United Republic of", "numcode"=>834, 'map' => 18})
Country.create({"position"=>14, "name"=>"ARMENIA", "iso3"=>"ARM", "iso"=>"AM", "id"=>261, "printable_name"=>"Armenia", "numcode"=>51})
Country.create({"position"=>15, "name"=>"ARUBA", "iso3"=>"ABW", "iso"=>"AW", "id"=>262, "printable_name"=>"Aruba", "numcode"=>533})
Country.create({"position"=>16, "name"=>"AUSTRALIA", "iso3"=>"AUS", "iso"=>"AU", "id"=>263, "printable_name"=>"Australia", "numcode"=>36, 'map' => 24})
Country.create({"position"=>204, "name"=>"THAILAND", "iso3"=>"THA", "iso"=>"TH", "id"=>451, "printable_name"=>"Thailand", "numcode"=>764,, 'map' => 23})
Country.create({"position"=>17, "name"=>"AUSTRIA", "iso3"=>"AUT", "iso"=>"AT", "id"=>264, "printable_name"=>"Austria", "numcode"=>40})
Country.create({"position"=>124, "name"=>"MADAGASCAR", "iso3"=>"MDG", "iso"=>"MG", "id"=>371, "printable_name"=>"Madagascar", "numcode"=>450, 'map' => 19})
Country.create({"position"=>205, "name"=>"TOGO", "iso3"=>"TGO", "iso"=>"TG", "id"=>452, "printable_name"=>"Togo", "numcode"=>768, 'map' => 17})
Country.create({"position"=>18, "name"=>"AZERBAIJAN", "iso3"=>"AZE", "iso"=>"AZ", "id"=>265, "printable_name"=>"Azerbaijan", "numcode"=>31})
Country.create({"position"=>44, "name"=>"CHILE", "iso3"=>"CHL", "iso"=>"CL", "id"=>291, "printable_name"=>"Chile", "numcode"=>152, 'map' => 13})
Country.create({"position"=>125, "name"=>"MALAWI", "iso3"=>"MWI", "iso"=>"MW", "id"=>372, "printable_name"=>"Malawi", "numcode"=>454, 'map' => 19})
Country.create({"position"=>206, "name"=>"TOKELAU", "iso3"=>"TKL", "iso"=>"TK", "id"=>453, "printable_name"=>"Tokelau", "numcode"=>772})
Country.create({"position"=>19, "name"=>"BAHAMAS", "iso3"=>"BHS", "iso"=>"BS", "id"=>266, "printable_name"=>"Bahamas", "numcode"=>44})
Country.create({"position"=>45, "name"=>"CHINA", "iso3"=>"CHN", "iso"=>"CN", "id"=>292, "printable_name"=>"China", "numcode"=>156, 'map' => 23})
Country.create({"position"=>126, "name"=>"MALAYSIA", "iso3"=>"MYS", "iso"=>"MY", "id"=>373, "printable_name"=>"Malaysia", "numcode"=>458, 'map' => 23})
Country.create({"position"=>207, "name"=>"TONGA", "iso3"=>"TON", "iso"=>"TO", "id"=>454, "printable_name"=>"Tonga", "numcode"=>776})
Country.create({"position"=>20, "name"=>"BAHRAIN", "iso3"=>"BHR", "iso"=>"BH", "id"=>267, "printable_name"=>"Bahrain", "numcode"=>48})
Country.create({"position"=>46, "name"=>"COLOMBIA", "iso3"=>"COL", "iso"=>"CO", "id"=>293, "printable_name"=>"Colombia", "numcode"=>170, 'map' => 11})
Country.create({"position"=>127, "name"=>"MALDIVES", "iso3"=>"MDV", "iso"=>"MV", "id"=>374, "printable_name"=>"Maldives", "numcode"=>462})
Country.create({"position"=>208, "name"=>"TRINIDAD AND TOBAGO", "iso3"=>"TTO", "iso"=>"TT", "id"=>455, "printable_name"=>"Trinidad and Tobago", "numcode"=>780, 'map' => 11})
Country.create({"position"=>21, "name"=>"BANGLADESH", "iso3"=>"BGD", "iso"=>"BD", "id"=>268, "printable_name"=>"Bangladesh", "numcode"=>50})
Country.create({"position"=>47, "name"=>"COMOROS", "iso3"=>"COM", "iso"=>"KM", "id"=>294, "printable_name"=>"Comoros", "numcode"=>174})
Country.create({"position"=>74, "name"=>"FRENCH POLYNESIA", "iso3"=>"PYF", "iso"=>"PF", "id"=>321, "printable_name"=>"French Polynesia", "numcode"=>258})
Country.create({"position"=>128, "name"=>"MALI", "iso3"=>"MLI", "iso"=>"ML", "id"=>375, "printable_name"=>"Mali", "numcode"=>466, 'map' => 17})
Country.create({"position"=>154, "name"=>"NORFOLK ISLAND", "iso3"=>"NFK", "iso"=>"NF", "id"=>401, "printable_name"=>"Norfolk Island", "numcode"=>574})
Country.create({"position"=>209, "name"=>"TUNISIA", "iso3"=>"TUN", "iso"=>"TN", "id"=>456, "printable_name"=>"Tunisia", "numcode"=>788, 'map' => 16})
Country.create({"position"=>22, "name"=>"BARBADOS", "iso3"=>"BRB", "iso"=>"BB", "id"=>269, "printable_name"=>"Barbados", "numcode"=>52})
Country.create({"position"=>48, "name"=>"CONGO", "iso3"=>"COG", "iso"=>"CG", "id"=>295, "printable_name"=>"Congo", "numcode"=>178, 'map' => 18})
Country.create({"position"=>75, "name"=>"GABON", "iso3"=>"GAB", "iso"=>"GA", "id"=>322, "printable_name"=>"Gabon", "numcode"=>266, 'map' => 18})
Country.create({"position"=>129, "name"=>"MALTA", "iso3"=>"MLT", "iso"=>"MT", "id"=>376, "printable_name"=>"Malta", "numcode"=>470})
Country.create({"position"=>155, "name"=>"NORTHERN MARIANA ISLANDS", "iso3"=>"MNP", "iso"=>"MP", "id"=>402, "printable_name"=>"Northern Mariana Islands", "numcode"=>580})
Country.create({"position"=>210, "name"=>"TURKEY", "iso3"=>"TUR", "iso"=>"TR", "id"=>457, "printable_name"=>"Turkey", "numcode"=>792, 'map' => 20})
Country.create({"position"=>49, "name"=>"CONGO, THE DEMOCRATIC REPUBLIC OF THE", "iso3"=>"COD", "iso"=>"CD", "id"=>296, "printable_name"=>"Congo", "numcode"=>180, 'map' => 18})
Country.create({"position"=>130, "name"=>"MARSHALL ISLANDS", "iso3"=>"MHL", "iso"=>"MH", "id"=>377, "printable_name"=>"Marshall Islands", "numcode"=>584})
Country.create({"position"=>156, "name"=>"NORWAY", "iso3"=>"NOR", "iso"=>"NO", "id"=>403, "printable_name"=>"Norway", "numcode"=>578, 'map' => 25})
Country.create({"position"=>211, "name"=>"TURKMENISTAN", "iso3"=>"TKM", "iso"=>"TM", "id"=>458, "printable_name"=>"Turkmenistan", "numcode"=>795})
Country.create({"position"=>23, "name"=>"BELARUS", "iso3"=>"BLR", "iso"=>"BY", "id"=>270, "printable_name"=>"Belarus", "numcode"=>112, 'map' => 14})
Country.create({"position"=>50, "name"=>"COOK ISLANDS", "iso3"=>"COK", "iso"=>"CK", "id"=>297, "printable_name"=>"Cook Islands", "numcode"=>184})
Country.create({"position"=>76, "name"=>"GAMBIA", "iso3"=>"GMB", "iso"=>"GM", "id"=>323, "printable_name"=>"Gambia", "numcode"=>270, 'map' => 17})
Country.create({"position"=>131, "name"=>"MARTINIQUE", "iso3"=>"MTQ", "iso"=>"MQ", "id"=>378, "printable_name"=>"Martinique", "numcode"=>474})
Country.create({"position"=>157, "name"=>"OMAN", "iso3"=>"OMN", "iso"=>"OM", "id"=>404, "printable_name"=>"Oman", "numcode"=>512, 'map' => 20})
Country.create({"position"=>184, "name"=>"SEYCHELLES", "iso3"=>"SYC", "iso"=>"SC", "id"=>431, "printable_name"=>"Seychelles", "numcode"=>690})
Country.create({"position"=>212, "name"=>"TURKS AND CAICOS ISLANDS", "iso3"=>"TCA", "iso"=>"TC", "id"=>459, "printable_name"=>"Turks and Caicos Islands", "numcode"=>796})
Country.create({"position"=>77, "name"=>"GEORGIA", "iso3"=>"GEO", "iso"=>"GE", "id"=>324, "printable_name"=>"Georgia", "numcode"=>268})
Country.create({"position"=>132, "name"=>"MAURITANIA", "iso3"=>"MRT", "iso"=>"MR", "id"=>379, "printable_name"=>"Mauritania", "numcode"=>478, 'map' => 17})
Country.create({"position"=>158, "name"=>"PAKISTAN", "iso3"=>"PAK", "iso"=>"PK", "id"=>405, "printable_name"=>"Pakistan", "numcode"=>586, 'map' => 20})
Country.create({"position"=>185, "name"=>"SIERRA LEONE", "iso3"=>"SLE", "iso"=>"SL", "id"=>432, "printable_name"=>"Sierra Leone", "numcode"=>694, 'map' => 17})
Country.create({"position"=>213, "name"=>"TUVALU", "iso3"=>"TUV", "iso"=>"TV", "id"=>460, "printable_name"=>"Tuvalu", "numcode"=>798})
Country.create({"position"=>51, "name"=>"COSTA RICA", "iso3"=>"CRI", "iso"=>"CR", "id"=>298, "printable_name"=>"Costa Rica", "numcode"=>188, 'map' => 8})
Country.create({"position"=>78, "name"=>"GERMANY", "iso3"=>"DEU", "iso"=>"DE", "id"=>325, "printable_name"=>"Germany", "numcode"=>276, 'map' => 14})
Country.create({"position"=>133, "name"=>"MAURITIUS", "iso3"=>"MUS", "iso"=>"MU", "id"=>380, "printable_name"=>"Mauritius", "numcode"=>480})
Country.create({"position"=>159, "name"=>"PALAU", "iso3"=>"PLW", "iso"=>"PW", "id"=>406, "printable_name"=>"Palau", "numcode"=>585})
Country.create({"position"=>52, "name"=>"COTE D'IVOIRE", "iso3"=>"CIV", "iso"=>"CI", "id"=>299, "printable_name"=>"Cote D'Ivoire", "numcode"=>384})
Country.create({"position"=>160, "name"=>"PANAMA", "iso3"=>"PAN", "iso"=>"PA", "id"=>407, "printable_name"=>"Panama", "numcode"=>591, 'map' => 8})
Country.create({"position"=>186, "name"=>"SINGAPORE", "iso3"=>"SGP", "iso"=>"SG", "id"=>433, "printable_name"=>"Singapore", "numcode"=>702})
Country.create({"position"=>53, "name"=>"CROATIA", "iso3"=>"HRV", "iso"=>"HR", "id"=>300, "printable_name"=>"Croatia", "numcode"=>191})
Country.create({"position"=>79, "name"=>"GHANA", "iso3"=>"GHA", "iso"=>"GH", "id"=>326, "printable_name"=>"Ghana", "numcode"=>288, 'map' => 17})
Country.create({"position"=>161, "name"=>"PAPUA NEW GUINEA", "iso3"=>"PNG", "iso"=>"PG", "id"=>408, "printable_name"=>"Papua New Guinea", "numcode"=>598})
Country.create({"position"=>187, "name"=>"SLOVAKIA", "iso3"=>"SVK", "iso"=>"SK", "id"=>434, "printable_name"=>"Slovakia", "numcode"=>703, 'map' => 14})
Country.create({"position"=>80, "name"=>"GIBRALTAR", "iso3"=>"GIB", "iso"=>"GI", "id"=>327, "printable_name"=>"Gibraltar", "numcode"=>292})
Country.create({"position"=>162, "name"=>"PARAGUAY", "iso3"=>"PRY", "iso"=>"PY", "id"=>409, "printable_name"=>"Paraguay", "numcode"=>600, 'map' => 13})
Country.create({"position"=>188, "name"=>"SLOVENIA", "iso3"=>"SVN", "iso"=>"SI", "id"=>435, "printable_name"=>"Slovenia", "numcode"=>705})
Country.create({"position"=>81, "name"=>"GREECE", "iso3"=>"GRC", "iso"=>"GR", "id"=>328, "printable_name"=>"Greece", "numcode"=>300, 'map' => 14})
Country.create({"position"=>163, "name"=>"PERU", "iso3"=>"PER", "iso"=>"PE", "id"=>410, "printable_name"=>"Peru", "numcode"=>604, 'map' => 11})
Country.create({"position"=>189, "name"=>"SOLOMON ISLANDS", "iso3"=>"SLB", "iso"=>"SB", "id"=>436, "printable_name"=>"Solomon Islands", "numcode"=>90})
Country.create({"position"=>82, "name"=>"GREENLAND", "iso3"=>"GRL", "iso"=>"GL", "id"=>329, "printable_name"=>"Greenland", "numcode"=>304, 'map' => 10})
Country.create({"position"=>190, "name"=>"SOMALIA", "iso3"=>"SOM", "iso"=>"SO", "id"=>437, "printable_name"=>"Somalia", "numcode"=>706, 'map' => 18})
Country.create({"position"=>83, "name"=>"GRENADA", "iso3"=>"GRD", "iso"=>"GD", "id"=>330, "printable_name"=>"Grenada", "numcode"=>308})
Country.create({"position"=>191, "name"=>"SOUTH AFRICA", "iso3"=>"ZAF", "iso"=>"ZA", "id"=>438, "printable_name"=>"South Africa", "numcode"=>710, 'map' => 19})
Country.create({"position"=>192, "name"=>"SPAIN", "iso3"=>"ESP", "iso"=>"ES", "id"=>439, "printable_name"=>"Spain", "numcode"=>724, 'map' => 14})
Country.create({"position"=>193, "name"=>"SRI LANKA", "iso3"=>"LKA", "iso"=>"LK", "id"=>440, "printable_name"=>"Sri Lanka", "numcode"=>144})
Country.create({"position"=>5, "name"=>"AFGHANISTAN", "iso3"=>"AFG", "iso"=>"AF", "id"=>252, "printable_name"=>"Afghanistan", "numcode"=>4, 'map' => 20})
Country.create({"position"=>6, "name"=>"ALBANIA", "iso3"=>"ALB", "iso"=>"AL", "id"=>253, "printable_name"=>"Albania", "numcode"=>8})
Country.create({"position"=>7, "name"=>"ALGERIA", "iso3"=>"DZA", "iso"=>"DZ", "id"=>254, "printable_name"=>"Algeria", "numcode"=>12, 'map' => 16})
Country.create({"position"=>114, "name"=>"LATVIA", "iso3"=>"LVA", "iso"=>"LV", "id"=>361, "printable_name"=>"Latvia", "numcode"=>428})
Country.create({"position"=>8, "name"=>"AMERICAN SAMOA", "iso3"=>"ASM", "iso"=>"AS", "id"=>255, "printable_name"=>"American Samoa", "numcode"=>16})
Country.create({"position"=>34, "name"=>"BULGARIA", "iso3"=>"BGR", "iso"=>"BG", "id"=>281, "printable_name"=>"Bulgaria", "numcode"=>100})
Country.create({"position"=>115, "name"=>"LEBANON", "iso3"=>"LBN", "iso"=>"LB", "id"=>362, "printable_name"=>"Lebanon", "numcode"=>422, 'map' => 20})
Country.create({"position"=>9, "name"=>"ANDORRA", "iso3"=>"AND", "iso"=>"AD", "id"=>256, "printable_name"=>"Andorra", "numcode"=>20})
Country.create({"position"=>35, "name"=>"BURKINA FASO", "iso3"=>"BFA", "iso"=>"BF", "id"=>282, "printable_name"=>"Burkina Faso", "numcode"=>854, 'map' => 17})
Country.create({"position"=>116, "name"=>"LESOTHO", "iso3"=>"LSO", "iso"=>"LS", "id"=>363, "printable_name"=>"Lesotho", "numcode"=>426, 'map' => 19})
Country.create({"position"=>3, "name"=>"Everywhere Else", "iso3"=>"NONE", "iso"=>"NONE", "id"=>1000, "printable_name"=>"Everywhere Else", "numcode"=>1000})
Country.create({"position"=>10, "name"=>"ANGOLA", "iso3"=>"AGO", "iso"=>"AO", "id"=>257, "printable_name"=>"Angola", "numcode"=>24, 'map' => 18})
Country.create({"position"=>36, "name"=>"BURUNDI", "iso3"=>"BDI", "iso"=>"BI", "id"=>283, "printable_name"=>"Burundi", "numcode"=>108, 'map' => 18})
Country.create({"position"=>117, "name"=>"LIBERIA", "iso3"=>"LBR", "iso"=>"LR", "id"=>364, "printable_name"=>"Liberia", "numcode"=>430, 'map' => 17})
Country.create({"position"=>224, "name"=>"VIRGIN ISLANDS, BRITISH", "iso3"=>"VGB", "iso"=>"VG", "id"=>471, "printable_name"=>"Virgin Islands, British", "numcode"=>92})
Country.create({"position"=>11, "name"=>"ANGUILLA", "iso3"=>"AIA", "iso"=>"AI", "id"=>258, "printable_name"=>"Anguilla", "numcode"=>660})
Country.create({"position"=>37, "name"=>"CAMBODIA", "iso3"=>"KHM", "iso"=>"KH", "id"=>284, "printable_name"=>"Cambodia", "numcode"=>116})
Country.create({"position"=>64, "name"=>"EQUATORIAL GUINEA", "iso3"=>"GNQ", "iso"=>"GQ", "id"=>311, "printable_name"=>"Equatorial Guinea", "numcode"=>226})
Country.create({"position"=>118, "name"=>"LIBYAN ARAB JAMAHIRIYA", "iso3"=>"LBY", "iso"=>"LY", "id"=>365, "printable_name"=>"Libyan Arab Jamahiriya", "numcode"=>434, 'map' => 16})
Country.create({"position"=>144, "name"=>"NAURU", "iso3"=>"NRU", "iso"=>"NR", "id"=>391, "printable_name"=>"Nauru", "numcode"=>520})
Country.create({"position"=>225, "name"=>"VIRGIN ISLANDS, U.S.", "iso3"=>"VIR", "iso"=>"VI", "id"=>472, "printable_name"=>"Virgin Islands, U.s.", "numcode"=>850})
Country.create({"position"=>12, "name"=>"ANTIGUA AND BARBUDA", "iso3"=>"ATG", "iso"=>"AG", "id"=>259, "printable_name"=>"Antigua and Barbuda", "numcode"=>28})
Country.create({"position"=>38, "name"=>"CAMEROON", "iso3"=>"CMR", "iso"=>"CM", "id"=>285, "printable_name"=>"Cameroon", "numcode"=>120, 'map' => 17})
Country.create({"position"=>119, "name"=>"LIECHTENSTEIN", "iso3"=>"LIE", "iso"=>"LI", "id"=>366, "printable_name"=>"Liechtenstein", "numcode"=>438})
Country.create({"position"=>145, "name"=>"NEPAL", "iso3"=>"NPL", "iso"=>"NP", "id"=>392, "printable_name"=>"Nepal", "numcode"=>524})
Country.create({"position"=>226, "name"=>"WALLIS AND FUTUNA", "iso3"=>"WLF", "iso"=>"WF", "id"=>473, "printable_name"=>"Wallis and Futuna", "numcode"=>876})
Country.create({"position"=>13, "name"=>"ARGENTINA", "iso3"=>"ARG", "iso"=>"AR", "id"=>260, "printable_name"=>"Argentina", "numcode"=>32, 'map' => 13})
Country.create({"position"=>2, "name"=>"CANADA", "iso3"=>"CAN", "iso"=>"CA", "id"=>286, "printable_name"=>"Canada", "numcode"=>124})
Country.create({"position"=>65, "name"=>"ERITREA", "iso3"=>"ERI", "iso"=>"ER", "id"=>312, "printable_name"=>"Eritrea", "numcode"=>232, 'map' => 18})
Country.create({"position"=>120, "name"=>"LITHUANIA", "iso3"=>"LTU", "iso"=>"LT", "id"=>367, "printable_name"=>"Lithuania", "numcode"=>440, 'map' => 14})
Country.create({"position"=>146, "name"=>"NETHERLANDS", "iso3"=>"NLD", "iso"=>"NL", "id"=>393, "printable_name"=>"Netherlands", "numcode"=>528})
Country.create({"position"=>227, "name"=>"WESTERN SAHARA", "iso3"=>"ESH", "iso"=>"EH", "id"=>474, "printable_name"=>"Western Sahara", "numcode"=>732, 'map' => 17})
Country.create({"position"=>40, "name"=>"CAPE VERDE", "iso3"=>"CPV", "iso"=>"CV", "id"=>287, "printable_name"=>"Cape Verde", "numcode"=>132})
Country.create({"position"=>66, "name"=>"ESTONIA", "iso3"=>"EST", "iso"=>"EE", "id"=>313, "printable_name"=>"Estonia", "numcode"=>233, 'map' => 14})
Country.create({"position"=>121, "name"=>"LUXEMBOURG", "iso3"=>"LUX", "iso"=>"LU", "id"=>368, "printable_name"=>"Luxembourg", "numcode"=>442})
Country.create({"position"=>147, "name"=>"NETHERLANDS ANTILLES", "iso3"=>"ANT", "iso"=>"AN", "id"=>394, "printable_name"=>"Netherlands Antilles", "numcode"=>530})
Country.create({"position"=>174, "name"=>"SAINT HELENA", "iso3"=>"SHN", "iso"=>"SH", "id"=>421, "printable_name"=>"Saint Helena", "numcode"=>654})
Country.create({"position"=>228, "name"=>"YEMEN", "iso3"=>"YEM", "iso"=>"YE", "id"=>475, "printable_name"=>"Yemen", "numcode"=>887, 'map' => 20})
Country.create({"position"=>41, "name"=>"CAYMAN ISLANDS", "iso3"=>"CYM", "iso"=>"KY", "id"=>288, "printable_name"=>"Cayman Islands", "numcode"=>136})
Country.create({"position"=>67, "name"=>"ETHIOPIA", "iso3"=>"ETH", "iso"=>"ET", "id"=>314, "printable_name"=>"Ethiopia", "numcode"=>231, 'map' => 18})
Country.create({"position"=>94, "name"=>"HUNGARY", "iso3"=>"HUN", "iso"=>"HU", "id"=>341, "printable_name"=>"Hungary", "numcode"=>348})
Country.create({"position"=>122, "name"=>"MACAO", "iso3"=>"MAC", "iso"=>"MO", "id"=>369, "printable_name"=>"Macao", "numcode"=>446})
Country.create({"position"=>148, "name"=>"NEW CALEDONIA", "iso3"=>"NCL", "iso"=>"NC", "id"=>395, "printable_name"=>"New Caledonia", "numcode"=>540})
Country.create({"position"=>229, "name"=>"ZAMBIA", "iso3"=>"ZMB", "iso"=>"ZM", "id"=>476, "printable_name"=>"Zambia", "numcode"=>894, 'map' => 19})
Country.create({"position"=>42, "name"=>"CENTRAL AFRICAN REPUBLIC", "iso3"=>"CAF", "iso"=>"CF", "id"=>289, "printable_name"=>"Central African Republic", "numcode"=>140, 'map' => 17})
Country.create({"position"=>68, "name"=>"FALKLAND ISLANDS (MALVINAS)", "iso3"=>"FLK", "iso"=>"FK", "id"=>315, "printable_name"=>"Falkland Islands (Malvinas)", "numcode"=>238})
Country.create({"position"=>95, "name"=>"ICELAND", "iso3"=>"ISL", "iso"=>"IS", "id"=>342, "printable_name"=>"Iceland", "numcode"=>352, 'map' => 15})
Country.create({"position"=>123, "name"=>"MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF", "iso3"=>"MKD", "iso"=>"MK", "id"=>370, "printable_name"=>"Macedonia", "numcode"=>807})
Country.create({"position"=>149, "name"=>"NEW ZEALAND", "iso3"=>"NZL", "iso"=>"NZ", "id"=>396, "printable_name"=>"New Zealand", "numcode"=>554, 'map' => 24})
Country.create({"position"=>175, "name"=>"SAINT KITTS AND NEVIS", "iso3"=>"KNA", "iso"=>"KN", "id"=>422, "printable_name"=>"Saint Kitts and Nevis", "numcode"=>659})
Country.create({"position"=>230, "name"=>"ZIMBABWE", "iso3"=>"ZWE", "iso"=>"ZW", "id"=>477, "printable_name"=>"Zimbabwe", "numcode"=>716, 'map' => 19})
