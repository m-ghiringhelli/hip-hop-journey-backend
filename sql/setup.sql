DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS albums CASCADE;

CREATE TABLE albums (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  artist VARCHAR NOT NULL,
  title VARCHAR NOT NULL,
  released VARCHAR NOT NULL,
  location VARCHAR NOT NULL,
  record_company VARCHAR DEFAULT NULL,
  region VARCHAR NOT NULL
);

CREATE TABLE users (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email VARCHAR NOT NULL UNIQUE,
  password_hash VARCHAR NOT NULL,
  current_album BIGINT DEFAULT 1,
  FOREIGN KEY (current_album) REFERENCES albums(id)
);

INSERT INTO albums (artist, title, released, location, record_company, region) VALUES
('The Sugar Hill Gang','Rapper’s Delight 12”','9/16/1979','Englewood, NJ','Sugar Hill','East'),
('Kurtis Blow','Christmas Rappin’ 12”','12/1/1979','The Bronx, NY','Mercury','East'),
('Grandmaster Flash and the Furious Five','The Message','10/1/1982','The Bronx, NY','Sugar Hill','East'),
('Run-D.M.C.','Run-D.M.C.','3/27/1984','Queens, NY','Profile, Arista','East'),
('The Cold Crush Brothers','Fresh, Wild, Fly And Bold','6/1/1984','The Bronx, NY','Tuff City','East'),
('Whodini','Escape','10/17/1984','Brooklyn, NY','Jive, Arista','East'),
('Mantronix ','Mantronix: The Album','6/1/1985','New York, NY','Sleeping Bag','East'),
('LL Cool J','Radio','11/18/1985','Queens, NY','Def Jam, Columbia','East'),
('Run-D.M.C.','Raising Hell','5/15/1986','Queens, NY','Profile, Arista','East'),
('Schooly D','Saturday Night! The Album','6/1/1986','Philadelphia, PA','Schooly D, Jive','East'),
('Beastie Boys ','Licensed to Ill','11/15/1986','NYC, NY','Def Jam, Columbia','East'),
('Afrika Bambaata & The Zulu Nation','Planet Rock: The Album','12/1/1986','The Bronx, NY','Tommy Boy, Warner Bros','East'),
('Boogie Down Productions','Crimincal Minded','3/3/1987','The Bronx, NY','B-Boy Records','East'),
('Public Enemy','Yo! Bum Rush The Show','4/1/1987','Hempstead','Def Jam, Columbia','East'),
('Eric B. & Rakim','Paid in Full','7/7/1987','Long Island, NY','4th & B''way, Island','East'),
('Too $hort','Born To Mack','7/20/1987','Oakland, CA','Dangerous Music, RCA','West'),
('Heavy D & The Boyz ','Living Large...','10/25/1987','Mount Vernon, NY','Uptown Records','East'),
('Ice T','Rhyme Pays','11/4/1987','Los Angeles, CA','Sire, Warner Bros. Records','West'),
('Salt n Pepa','Hot, Cool & Vicious','12/8/1987','Queens, NY','Next Plateau Records','East'),
('Biz Markie ','Goin Off','2/23/1988','Long Island, NY','Cold Chillin'', Warner Bros','East'),
('DJ Jazzy Jeff & The Fresh Prince','He’s the DJ, I’m the Rapper','4/5/1988','Philadelphia, PA','Jive, RCA','East'),
('EPMD','Strictly Business','6/7/1988','Brentwood, NJ','Fresh, Sleeping Bag, Priority, EMI','East'),
('Big Daddy Kane ','Long Live The Kane','6/21/1988','Bedford-Stuyvesant, Brooklyn, NY','Cold Chillin'', Warner Bros','East'),
('Public Enemy','It Takes a Nation Of Millions to Hold Us Back','6/28/1988','Long Island, NY','Def Jam, Columbia','East'),
('N.W.A.','Straight Outta Compton','8/8/1988','Compton, CA','Ruthless, Priority','West'),
('Marley Marl - In Control, Volume 1 - 1988','In Control, Volume 1','9/11/1988','Queens, NY','Cold Chillin'', Warner Bros','East'),
('MC Lyte ','Lyte as a Rock','9/13/1988','Brooklyn, NY','First Priority Music, Atlantic','East'),
('Eazy-E','Eazy Duz It','9/13/1988','Compton, CA','Ruthless, Priority','West'),
('Ultramagnetic MCs','Critical Beatdown','10/4/1988','The Bronx, NY','Next Plateau','East'),
('Slick Rick','The Great Adventures of Slick Rick','11/1/1988','The Bronx, NY','Def Jam, Columbia, CBS','East'),
('Queen Latifah ','All Hail the Queen','11/1/1988','Newark, NJ','Tommy Boy','East'),
('Jungle Brothers ','Straight Out The Jungle','11/8/1988','NYC, NY','Idlers, Warlock Records','East'),
('King Tee','Act A Fool','11/15/1988','Compton, CA','Capitol','West'),
('Too $hort','Life Is... Too Short','1/31/1989','Oakland, CA','Jive','West'),
('2 Live Crew','As Nasty As They Wana Be','2/7/1989','Miami, FL','Luke Skyywalker Records','South'),
('De La Soul','3 Feet High and Rising','3/3/1989','Long Island, NY','Tommy Boy, Warner Bros','East'),
('Geto Boys','Grip It! On That Other Level','3/12/1989','Houston, TX','Rap-A-Lot Records','South'),
('Kool G Rap & DJ Polo ','Road to the Ritches','3/14/1989','Queens, NY','cold Chillin'', Warner Bros','East'),
('Beastie Boys ','Paul''s Boutique','7/25/1989','NYC, NY','Capitol','East'),
('The D.O.C.','No One Can Do It Better','8/1/1989','Los Angeles, CA','Ruthless, Atco, Atlantic','West'),
('Ice T','The Iceberg','10/10/1989','Los Angeles, CA','Sire, Warner Bros. Records','West'),
('415','41Fivin','1/14/1990','Oakland, CA','Big League Records','West'),
('MC Hammer','Please Hammer Don''t Hurt ''Em','2/12/1990','Oakland, CA','Capitol Records, EMI','West'),
('Above The Law','Livin Like Hustlas','2/22/1990','Pomona, CA','Ruthless, Epic','West'),
('Digital Underground','Sex Packets','3/26/1990','Oakland, CA','Tommy Boy Music, TNT Records','West'),
('Public Enemy ','Fear of A Black Planet','4/10/1990','Long Island, NY','
Def Jam, Columbia','East'),
('X-Clan ','To The East, Blackwards','4/24/1990','Brooklyn, NY','4th & B''way, Island','East'),
('Ice Cube','Amerikkka''s Most Wanted','5/13/1990','Los Angeles, CA','Priority','West'),
('LL Cool J','Mamma Said Knock You Out','8/27/1990','Queens, NY','Def Jam, Columbia, CBS','East'),
('Paris','The Devil Made Me Do It','10/9/1990','San Francisco, CA','Tommy Boy Music','West'),
('Brand Nubian ','One For All ','12/4/1990','New Rochelle, NY','Elektra','East'),
('Gang Starr','Step In The Arena','1/15/1991','Brooklyn, NY','Chrysalis,EMI Records','East'),
('DJ Quik','Quik Is The Name','1/15/1991','Compton, CA','Profile','West'),
('Ganksta N-I-P','The South Park Psycho
','2/26/1991','Houston, TX','Rap-A-Lot Records, Priority Records','South'),
('X-Raided','Psycho Active','4/16/1991','Sacramento, CA','Black Market Records','West'),
('De La Soul ','De La Soul Is Dead','5/13/1991','Long Island, NY','
Tommy Boy,Warner Bros. Records','East'),
('Ice T','Original Gangsta','5/14/1991','Los Angeles, CA','Sire, Warner Bros. Records','West'),
('N.W.A.','Niggaz 4 Life','5/28/1991','Compton, CA','Ruthless, Priority','West'),
('Geto Boys','We Can''t Be Stopped
','7/1/1991','Houston, TX','Rap-A-Lot Records, Priority Records','South'),
('A Tribe Called Quest','The Low End Theory','9/24/1991','Queens, NY','Jive, RCA Records','East'),
('Ice Cube','Death Certificate','10/29/1991','Los Angeles, CA','Priority, EMI','West'),
('Lord Finesse ','Return of the Funky Man','2/11/1992','Bronx, NY','Giant, Reprise','East'),
('Arrested Development','3 Years, 5 Months & 2 Days in the Life Of...
','3/24/1992','Atlanta, GA','Rhrysalis, EMI Records','South'),
('Pete Rock & CL Smooth ','Mecca and the Soul Brother','7/9/1992','
Mount Vernon, NY','','East'),
('Too $hort','Shorty The Pimp','7/14/1992','Oakland, CA','Dangerous Music, Jive','West'),
('RBL Posse','A Lesson To Be Learned','9/16/1992','San Francisco, CA','In-A-Minute Records','West'),
('Redman ','Whut? The Album','9/22/1992','Newark, NJ','Def Jam','East'),
('Diamond D ','Stunts Blunts & Hip Hop','9/22/1992','Bronx, NY','Chemistry, Mercury, PolyGram Records','East'),
('Ice Cube','The Predator','11/17/1992','Los Angeles, CA','Priority, EMI','West'),
('The Pharcyde','Bizarre Ride II the Pharcyde','11/24/1992','Los Angeles, CA','Delicious Vinyl','West'),
('Dr. Dre','The Chronic','12/15/1992','Compton, CA','Death Row, Interscope, Priority','West'),
('Above the Law','Black Mafia Life','2/2/1993','Pomona, CA','','West'),
('2Pac','Strictly 4 My NIGGAZ','2/16/1993','Oakland, CA','Interscope Records, Atlantic Recording, T.N.T. Recordings','West'),
('Bloods & Crips','Bangin'' On Wax','3/9/1993','Los Angeles, CA','Dangerous Records','West'),
('Cypress Hill','Black Sunday','6/20/1993','South Gate, CA','Ruffhouse, Columbia','West'),
('Mac Mall','Illegal Business','7/12/1993','Vallejo, CA','Don''t Give Up Productions','West'),
('8Ball & MJG','Comin'' Out Hard','8/1/1993','Memphis, TN','Suave Records','South'),
('The Alkoholiks','21 & Over','8/24/1993','Los Angeles, CA','Loud, RCA','West'),
('Souls of Mischief','93'' Til Infinity','9/6/1993','Oakland, CA','Jive, BMG Records','West'),
('Spice 1','187 He Wrote','9/28/1993','Hayward, CA','Jive','West'),
('Black Moon ','Enta Da Stage','10/19/1993','Brooklyn, NY','Nervous','East'),
('Wu-Tang Clan','Enter the Wu-Tang (36 Chambers)','11/9/1993','Staten Island, NY','Loud','East'),
('A Tribe Called Quest','Midnight Marauders','11/9/1993','Queens, NY','Jive, BMG','East'),
('Snoop Doggy Dogg','Doggystyle','11/23/1993','Long Beach, CA','Death Row, Interscope','West'),
('Mac Dre','Young Black Brotha The Album','11/29/1993','Vallejo, CA','Strictly Business Music','West'),
('Nas','Illmatic','4/19/1994','Queens, NY','Columbia','East'),
('Outkast','Southernplayalisticadillacmuzik','4/26/1994','Atlanta, GA','LaFace Records','South'),
('Warren G','Regulate... The G Funk Era','6/7/1994','Long Beach, CA','Def Jam, Violator','West'),
('MC Eiht','We Come Strapped','7/19/1994','Compton, CA','Epic Street','West'),
('The Notorious B.I.G.','Ready to Die','9/13/1994','Brooklyn, NY','Bad Boy','East'),
('The Coup','Genocide and Juice','10/18/1994','Oakland, CA','Wild Pitch Records','West'),
('Scarface','The Diary','10/18/1994','Houston, TX','Rap-A-Lot Records, Noo Trybe Records','South'),
('Common','Resurrection','10/25/1994','Chicago, IL','Relativity Records','Midwest'),
('Smif - N - Wessun ','Dah Shinin''','1/10/1995','Brooklyn, NY','Wreck','East'),
('Brotha Lynch Hung','Season of Da Siccness','2/28/1995','Sacramento, CA','Black Market Records','West'),
('2Pac','Me Against The World','3/14/1995','Oakland, CA','Interscope, Atlantic, Out Da Gutta Records','West'),
('E-40','In A Major Way','3/14/1995','Vallejo, CA','Sick Wi''d It Records, Jive','West'),
('Big L','Lifestylez ov da Poor & Dangerous','3/28/1995','Harlem, NY','Columbia','East'),
('Dre Dog aka Andre Nickatina','I Hate You With A Passion','4/19/1995','San Francisco, CA','In-A-Minute Records','West'),
('Mobb Deep','The Infamous','4/25/1995','Queens, NY','Loud, RCA, BMG','East'),
('Naughty by Nature ','Poverty''s Paradise','5/2/1995','East Orange, NJ','Tommy Boy','East'),
('Three 6 Mafia','Mystic Stylez','5/23/1995','Memphis, TN','Prophet Entertainment','South'),
('DJ Screw','Volume II: All Screwed Up','6/1/1995','Houston, TX','Bigtyme Recordz','South'),
('Gangsta Pat','Deadly Verses','6/10/1995','Memphis, TN','Triad Records','South'),
('C-Bo','Tales From The Crypt','6/15/1995','Sacramento, CA','AWOL Records','West'),
('The Luniz','Operation Stackola','7/4/1995','Oakland, CA','C-Note Records, Noo Trybe Records','West'),
('Bone Thugs-N-Harmony','E. 1999 Eternal','7/25/1995','Cleveland, OH','Ruthless, Relativity','Midwest'),
('Raekwon','Only Built 4 Cuban Linx...','8/1/1995','Staten Island, NY','Loud, RCA','East'),
('E.S.G.','Sailin Da South','9/12/1995','Houston, TX','Perrion Entertainment, Priority Records','South'),
('The Dogg Pound','Dogg Food','10/31/1995','Long Beach, CA','Death Row, Interscope','West'),
('GZA/Genius','Liquid Swords','11/7/1995','Brooklyn, NY','Geffen, MCA','East'),
('Goodie Mob','Soul Food','11/21/1995','Atlanta, GA','LaFace Records','South'),
('B.G.','Chopper City','1/26/1996','New Orleans, LA','Cash Money Records','South'),
('The Fugees ','The Score','2/13/1996','South Orange, NJ','Ruffhouse, Columbia','East'),
('2Pac','All Eyez On Me','2/13/1996','Oakland, CA','Death Row, Interscope','West'),
('Kingpin Skinny Pimp','King of da Playaz Ball','4/1/1996','Memphis, TN','Prophet Entertainment','South'),
('Master P','Ice Cream Man','4/16/1996','New Orleans, LA','No Limit Records, Priority Records','South'),
('Dr. Octagon','Dr. Octagonecologyst','5/6/1996','Bronx, NY','DreamWorks, Geffen, MCA Records','East'),
('N.O.D.','Niggaz Of Destruction','6/1/1996','Memphis, TN','Street Smart Records','South'),
('Jay-Z ','Reasonable Doubt','6/25/1996','Brooklyn, NY','Roc-A-Fella, Priority','East'),
('Nas ','It Was Written','7/2/1996','Queens, NY','Columbia','East'),
('UGK','Ridin Dirty','7/26/1996','Port Arthur, TX','Jive','South'),
('DJ Screw','3 ''n the Mornin'' Pt. 2: Blue','8/27/1996','Houston, TX','Bigtyme Recordz','South'),
('Outkast','ATLiens','8/27/1996','Atlanta, GA','LaFace Records','South'),
('DJ Shadow','Entroducing','9/16/1996','Oakland, CA','Mo'' Wax','West'),
('The Roots','Illadelph Halflife','9/24/1996','Philadelphia, PA','DGC','East'),
('Westside Connection','Bow Down','10/22/1996','Los Angeles, CA','Lench Mob, Priority','West'),
('Ghostface Killah ','Ironman','10/29/1996','Staten Island, NY','Razor Sharp, Epic Street, Sony','East'),
('2Pac aka Mackaveli','The Don Killuminati: The 7 Day Theory','11/5/1996','Oakland, CA','Death Row, Makaveli, Interscope Records','West'),
('Richie Rich','Seasoned Veteran','11/5/1996','Oakland, CA','Def Jam Recordings','West'),
('Lil Kim ','Hard Core','11/12/1996','Bedford Stuyvestant, Brooklyn', null,'East'),
('Tommy Wright III','On The Run','11/19/1996','Memphis, TN','Street Smart Records','South'),
('Redman ','Muddy Waters','12/10/1996','Newark, NJ','Def Jam','East'),
('TRU','Tru 2 Da Game','2/18/1997','New Orleans, LA','No Limit Records, Priority Records','South'),
('3xKrazy','Stackin Chips','3/8/1997','Oakland, CA','Noo Trybe Records','West'),
('Suga Free','Street Gospel','5/20/1997','Pomona, CA','Island Black Music','West'),
('Missy Elliott','Supa Dupa Fly','7/15/1997','Portsmouth, VA','The Goldmind, Elektra','South'),
('Company Flow ','Funcrusher Plus','7/22/1997','Brooklyn, NY','Definitive Jux, Rawkus, Priority','East'),
('Master P','Ghetto D','9/2/1997','New Orleans, LA','No Limit Records, Priority Records','South'),
('Ma$e','Harlem World','10/28/1997','Harlem World NY','Bad Boy','East'),
('Mystikal','Unpredictable','11/11/1997','New Orleans, LA','No Limit Records, Jive','South'),
('Young Bleed','My Balls and My Word','1/20/1998','Baton Rouge, LA','No Limit Records, Priority Records','South'),
('Big Tymers','How U Luv That','3/17/1998','New Orleans, LA','Cash Money Records','South'),
('Fat Pat','Ghetto Dreams','3/17/1998','Houston, TX','Wreckshop Records','South'),
('Hieroglyphics','3rd Eye Vision','3/24/1998','Oakland, CA','Hiero Imperium','West'),
('Big Punisher','Capital Punishment','4/28/1998','The Bronx, NY','Terror Squad, Loud','East'),
('DMX ','It''s Dark And Hell Is Hot','5/12/1998','Yonkers, NY','Ruff Ryders, Def Jam','East'),
('Nate Dogg','G Funk Classics','7/21/1998','Long Beach, CA','Breakaway','West'),
('Lauryn Hill ','The Miseducation of Lauryn Hill','8/25/1998','East Orange, NJ','Ruffhouse, Colombia','East'),
('Black Star ','Mos Def & Talib Kweli Are Black Star','8/25/1998','Brooklyn, NY','Rawkus, Priority','East'),
('Big Tymers','How U Luv That Vol 2','9/22/1998','New Orleans, LA','Cash Money Records','South'),
('Trick Daddy','www.thug.com','9/22/1998','Florida','Slip-N-Slide Records','South'),
('Outkast','Aquemini','9/29/1998','Atlanta, GA','LaFace Records','South'),
('Juvenile','400 Degreez','11/3/1998','New Orleans, LA','Cash Money Records','South'),
('DJ Quik','Rhythm-al-ism','11/10/1998','Compton, CA','Arista','West'),
('DMX ','Flesh of My Flesh, Blood of My Blood','12/22/1998','Yonkers, NY','Ruff Ryders, Def Jam','East'),
('Eminem','The Slim Shady LP','2/25/1999','Detroit, MI','Aftermath, Interscope, Web','Midwest'),
('Three 6 Mafia','Underground Vol. 1','3/2/1999','Memphis, TN','Smoked Out Music','South'),
('Pastor Troy','We Ready (I Declare War)','3/16/1999','Augusta, GA','Sounds Of Atlanta Records','South'),
('Snoop Doggy Dogg','No Limit Top Dogg','5/11/1999','Long Beach, CA','No Limit, Priority','West'),
('Lil Keke','It Was All A Dream','7/14/1999','Houston, TX','Jam Down Records','South'),
('Hot Boys','Guerilla Warfare','7/27/1999','New Orleans, LA','Cash Money Records','South'),
('Project Pat','Ghetty Green','9/14/1999','Memphis, TN','Loud Records','South'),
('Mos Def','Black on Both Sides','10/12/1999','Brooklyn, NY','Rawkus, Priority','East'),
('Koopsta Knicca','Da Devil''s Playground','10/26/1999','Memphis, TN','Smoke On Records','South'),
('Lil Wayne','Tha Block Is Hot','11/2/1999','New Orleans, LA','Cash Money Records','South'),
('Dr. Dre','The Chronic 2001','11/16/1999','Compton, CA','Aftermath, Interscope','West'),
('Ghostface Killah ','Supreme Clientele','1/25/2000','Staten Island, NY','Epic','East'),
('Common','Like Water for Chocolate','3/28/2000','Chicago, IL','MCA, Universal Records','Midwest'),
('Big Tymers','I Got That Work','5/16/2000','New Orleans, LA','Cash Money Records','South'),
('Eminem','The Marshall Mathers LP','5/23/2000','Detroit, MI','Aftermath, Interscope, Shady','Midwest'),
('Zion i','Mind Over Matter','5/30/2000','Oakland, CA','Ground Control Records','West'),
('Jurassic 5','Quality Control','6/19/2000','Los Angeles, CA','Interscope','West'),
('Nelly','Country Grammar','6/27/2000','St. Louis, MO','Universal, Fo'' Reel','Midwest'),
('Slum Village','Fan-tas-tic Vol. 2','7/13/2000','Detroit, MI','Counterflow','Midwest'),
('Big Moe','City Of Syrup','7/18/2000','Houston, TX','Wreckshop Records','South'),
('Deltron 3030','Deltron 3030','10/17/2000','Oakland, CA','75 Ark','West'),
('Xzibit','Restless','12/12/2000','Los Angeles, CA','Loud Records','West'),
('Project Pat','Mista Don''t Play','2/27/2001','Memphis, TN','Hypnotize Minds, Loud Records','South'),
('Cormega','The Realness','7/24/2001','Queens, NY','Legal Hustle','East'),
('Jay-Z','The Blueprint','9/11/2001','Brooklyn, NY','Roc-A-Fella, Def Jam','East'),
('Ludacris','Word Of Mouf','11/27/2001','Atlanta, GA','Def Jam South, Disturbing Tha Peace','South'),
('Devin the Dude','Just Tryin'' ta Live
','1/29/2002','Houston, TX','Rap-A-Lot Records','South'),
('E-40','Grit & Grind','7/9/2002','Vallejo, CA','Jive','West'),
('Scarface','The Fix','8/6/2002','Houston, TX','Def Jam South, J. Prince Entertainment','South'),
('Clipse','Lord Willin''','8/20/2002','Virginia Beach, VA','Def Jam South, Def Jam','South'),
('Lil Flip','Underground Legend','8/27/2002','Houston, TX','Sucka Free Records, Loud Records, Columbia','South'),
('50 Cent ','Get Rich Or Die Tryin','2/6/2003','Jamacia, Queens, NY','Shady, Aftermath, Interscope','East'),
('David Banner','Mississippi The Album','5/20/2003','Jackson, MS','Universal Records','South'),
('T.I.','Trap Muzik','8/19/2003','Atlanta, GA','Atlantic, Grand Hustle','South'),
('Keak Da Sneak','Counting Other People''s Money','10/14/2003','Oakland, CA','Moe Doe Entertainment','West'),
('Jay-Z','The Black Album','11/14/2003','Brooklyn, NY','Roc-A-Fella, Def Jam','East'),
('Twista','Kamikaze','1/27/2004','Chicago, IL','Atlantic','Midwest'),
('Kanye West','The College Dropout','2/10/2004','Chicago, IL','Roc-A-Fella, Def Jam','Midwest'),
('Madvillain','Madvillainy','3/23/2004','Long Island, NY','Stones Throw','East'),
('Mac Dre','Ronald Dregon: Dreganomics','7/20/2004','Oakland, CA','Thizz Entertainment','West'),
('213','The Hard Way','8/13/2004','Long Beach, CA','TVT Records','West'),
('The Team','Negro Leaugue ','10/26/2004','Oakland, CA','Moe Doe Entertainment','West'),
('Lil Jon & The East Side Boyz','Crunk Juice','11/16/2004','Atlanta, GA','TVT Records','South'),
('Cam’ron','Purple Haze','12/7/2004','Harlem, NY','Roc-A-Fella, Diplomat, Def Jam','East'),
('The Game','The Documentary','1/8/2005','Compton, CA','Aftermath Entertainment, Interscope Records, G Unit, Czar Entertainment','West'),
('The Jacka','The Jack Artist','3/15/2005','Pittsburg, CA','The Artist Records','West'),
('Mike Jones','Who Is Mike Jones?','4/19/2005','Houston, TX','Warner Bros. Records','South'),
('Gucci Mane','Trap House','5/24/2005','Atlanta, GA','Big Cat Records','South'),
('Common','Be','5/24/2005','Chicago, IL','GOOD, Geffen','Midwest'),
('Young Jeezy','Let''s Get It: Thug Motivation 101','7/26/2005','Atlanta, GA','Def Jam Recordings','South'),
('T-Pain','Rappa Ternt Sanga','12/5/2005','Florida','Konvict, Jive, Zomba','South'),
('Lil Wayne','Tha Carter 2','12/6/2005','New Orleans, LA','Cash Money Records, Young Money, Universal','South'),
('CunninLynguists','A Piece of Strange','1/24/2006','Lexington, KT','QN5, L.A. Underground','South'),
('J Dilla','Donuts','2/7/2006','Detroit, MI','Stones Throw','Midwest'),
('E-40','My Ghetto Report Card','3/14/2006','Vallejo, CA','Reprise Records, Sick Wid It Records','West'),
('T.I.','King','3/28/2006','Atlanta, GA','Atlantic, Grand Hustle','South'),
('Traxamillion','The Slapp Addict','8/22/2006','San Jose, CA','Slapp Addicts Production','West'),
('Lupe Fiasco','Lupe Fiasco''s Food & Liquor','9/19/2006','Chicago, IL','1st & 15th, Atlantic','Midwest'),
('UGK','Underground Kingz','8/7/2007','Houston, TX','Jive','South'),
('Soulja Boy','SouljaBoyTellEm.com','10/2/2007','Atlanta, GA','Collipark, Stacks On Deck, Interscope','South'),
('Lupe Fiasco','The Cool','12/18/2007','Chicago, IL','1st & 15th, Atlantic','Midwest'),
('Lil Wayne','Tha Carter 3','6/9/2008','New Orleans, LA','Cash Money Records, Universal Motown','South'),
('A.B.N','It Is What It Is','7/15/2008','Houston, TX','Rap-A-Lot Records','South'),
('Kanye West','808s & Heartbreak','11/24/2008','Chicago, IL','Roc-A-Fella, Def Jam','Midwest');

INSERT INTO users (email, password_hash) VALUES
('sample@sample.com', '123456');