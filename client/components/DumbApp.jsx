import React from 'react';
import moment from 'moment';
import Axios from 'axios';
import Reviews from './reviews';
import ReviewModal from './reviewModal';

class App extends React.Component {
  
  static formatDate(date) {
    return moment(new Date(date)).fromNow().toString();
  }
  
  constructor(props) {
    super(props);

    this.state = {
      reviews: props.data,
    };

  }
  
  render() {
    return (
      <div className="Reviews">
        <div id="rApp">
          <div className="rBodyContainer">
            <div
              className="rPageContainer"
              onClick={() => this.toggleModal()}
            >
                <hr />
                <div className="rPaddingTop">
                  <h1 className="rReviewTitle">Reviews</h1>
                  <Reviews
                    isModalShowing={this.state.isModalShowing}
                    toggleModal={this.toggleModal}
                    reviews={this.state.reviews}
                    formatDate={App.formatDate}
                  />
                  <div className="rModalButtonContainer">
                    <a
                      className="rMoreReviews"
                      id="moreReviews"
                      style={{ 'color': '#914669' }}
                      onClick={this.toggleModal}
                    >
                      Read all {this.state.reviews.length} reviews
                    </a>
                  </div>
                </div>
            </div>
            <hr />
          </div>
        </div>
      </div>
    );
  }
}

export default App;