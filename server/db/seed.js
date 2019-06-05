const faker = require('faker');
const { pool } = require('./index.js');

const randomIntInRange = function randomIntInRange(start, end) {
  return Math.floor(Math.random() * (end - start + 1)) + start;
};

const randomSelect = function randomSelect(list) {
  return list[randomIntInRange(0, list.length - 1)];
};

const generateRandomReview = function generateRandomReview() {
  let starter = ['OMG! ', 'JUST. WOW. ', '', '', 'What a blast! ', 'My wife and I really enjoyed the location. ', '', 'Good news everyone! ', 'Very clean and beautiful decore! ', 'Great space. ', 'Unfuhgetable! ', 'It was meh. ', 'It was nice. ', 'From the moment I saw the place I knew it would be a trainwreck. ', 'WARNING: not as advertised. '];
  let hostAdjective = ['very helpful and pleasant', 'warm and friendly', 'kinda a jerk', 'charming', 'nice but couldn\'t stop talking about her cats', 'friendly'];
  let location = ['house', 'home', 'house', 'apartment', 'townhouse', 'house', 'apartment', 'villa', 'apartment'];
  let locationAdjective = ['just as advertised.', 'just what the doctor ordered.', 'breath taking.', 'cute and cozy.', 'lovely.'];
  let stayAdjective = ['interesting to say the least.', 'quite pleasent.', 'fun and relaxing.', 'well worth the price.'];
  let ending = ['In conclusion ', 'all in all ', '', '', '', ''];
  let ending2 = [' would say things went very well.', ' had a great time.', ' absolutely loved my time there.', ' we had a wonderful stay.', ' hated it.', ' would never go back.', 't was great.'];

  return `${randomSelect(starter)}The host was ${randomSelect(hostAdjective)} and the ${randomSelect(location)} was ${randomSelect(locationAdjective)}
  The ${randomSelect(['two', 'three', 'four', 'five'])} days I spent there were ${randomSelect(stayAdjective)} ${randomSelect(ending)}I${randomSelect(ending2)}`
};

const userPhotos = [
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
];
const generateRandomUserPhoto = () => {
  return randomSelect(userPhotos);
};

const start = () => {
  pool.query('BEGIN TRANSACTION', err => {
    err ? console.log(err) : console.log('COMMENCE TRANSACTION')
  })
}

const insert = (num) => {
  const queryString = 'INSERT INTO reviews (text, date, guest, photo) VALUES ($1,$2,$3,$4)';
  let params;
  for (let i = 0; i < num; i += 1) {
    params = [
      generateRandomReview(),
      faker.date.past(),
      faker.name.firstName(),
      generateRandomUserPhoto()
    ];
    if (i === 60000) {
      console.log('We made it to ', i,'!')
    }
    pool.query(queryString, params, err => {
      if (err) {
        return console.log(err);
      }
    });
  }
};

const end = () => {
  pool.query('END TRANSACTION', err => {
    return err ? console.log(err) : console.log('all done :)');
  })
}

const seed = (num) => {
  return Promise.resolve(start())
    .then(() => insert(num))
    .then(() => end());
}

for (let i = 0; i < 40; i++) {
  console.log(i * 250000);
  seed(100000);
}

module.exports = insert;