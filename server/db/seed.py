from faker import Faker
from string import Template
import random
fake = Faker()

templ = "(\'$text\', \'$date\', \'$guest\', \'$photo\')"
randomText = [
  "Awesome", 'OMG! ', 'JUST. WOW. ', '', '', 'What a blast! ', 'My wife and I really enjoyed the location. ', '', 'Good news everyone! ', 'Very clean and beautiful decore! ', 'Great space. ', 'Unfuhgetable! ', 'It was meh. ', 'It was nice. ', 'From the moment I saw the place I knew it would be a trainwreck. ', 'WARNING: not as advertised. ', 'just as advertised.', 'just what the doctor ordered.', 'breath taking.', 'cute and cozy.', 'lovely.'
]
photos = [
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ZxG76-UM6w0.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225__t_EMqrNzi0.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_aLT-JhaNqIU.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_bVPtaf-8jI8.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_gtpm-tiTr9U.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_j7Z-XUHHN40.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_koE9TOrYrgo.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_m663zRzRe40.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_myggK4JQdLI.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_qDs5alqjJAk.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_r3pqFjVmrQU.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ufWjkFmTNXo.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_v6771a4avV4.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_yki80w96VZ0.jpeg'
]

innerLoop=20
f = open('insert2.sql', 'w+')
# f.close()
f.write('\\c airbnb_reviews \r\n')
# f = open('inser.sql', 'a+')
for i in range (100000):
  f.write("INSERT INTO reviews (text, date, guest, photo) VALUES ")
  for j in range (innerLoop):
    values=Template(templ).substitute(
      text=fake.sentence(ext_word_list=randomText, nb_words=3),
      date=fake.date(pattern="%Y-%m-%d", end_datetime=None),
      guest=fake.name().split()[0],
      photo=random.choice(photos),
    )
    f.write(values)
    if j != innerLoop - 1:
      f.write(', ')
    else:
      f.write(';\r\n')
  # f.write("\r\n")
f.close()