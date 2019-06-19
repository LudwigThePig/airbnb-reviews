import React from 'react';
import Axios from 'axios';
import styled from 'styled-components';
import Reviews from './reviews';
import ReviewModal from './reviewModal';
// import styles from '../main.scss';

const ModalProp = styled.div`
  &&& {
    opacity: ${props => props.isModalShowing ? "0.5" : "1.0"};
  }
`;

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      reviews: props,
      isModalShowing: false,
      isModalSelected: false
    };

    this.toggleModal = this.toggleModal.bind(this);
    this.selectModal = this.selectModal.bind(this);
  }


  toggleModal() {
    this.setState({
      isModalShowing: !this.state.isModalShowing,
      isModalSelected: false
    });
  }

  selectModal() {
    this.setState({
      isModalSelected: true
    });
  }


  formatDate(date) {
    var seconds = Math.floor((new Date() - date) / 1000);
    var interval = Math.floor(seconds / 31536000);
    if (interval > 1) {
      return interval + " years";
    }
    interval = Math.floor(seconds / 2592000);
    if (interval > 1) {
      return interval + " months";
    }
    interval = Math.floor(seconds / 86400);
    if (interval > 1) {
      return interval + " days";
    }
    interval = Math.floor(seconds / 3600);
    if (interval > 1) {
      return interval + " hours";
    }
    interval = Math.floor(seconds / 60);
    if (interval > 1) {
      return interval + " minutes";
    }
    return Math.floor(seconds) + " seconds";
  }

  sortByDate(reviews) {
    return reviews.sort((a, b) => new Date(b.date) - new Date(a.date));
  }

  componentMount() {
    Axios({
      url: `http://ec2-54-202-47-91.us-west-2.compute.amazonaws.com/api/listings/reviews/${Math.floor(Math.random() * 999999 / 2) + 499980}`,
      method: 'GET',
      headers: {
        'Accepts': 'application/json',
        'Content-Type': 'application/json'
      },
    })
      .then(res => res.data)
      .then(data => {
        this.setState(state => {
          data = this.sortByDate(data)
          return {
            reviews: data
          }
        });
      })
      .catch(console.error);
  }

  render() {
    return (
      <div className="Reviews">
        <div id="rApp">
          <div className="rBodyContainer">
            <div className="rModalContainer">
              <ReviewModal
                id="modal"
                isModalShowing={this.state.isModalShowing}
                isModalSelected={this.state.isModalSelected}
                selectModal={this.selectModal}
                toggleModal={this.toggleModal}
                reviews={this.state.reviews}
                formatDate={this.formatDate}
              />
            </div>
            <div
              className="rPageContainer"
              onClick={() => this.toggleModal()}
            >
              <ModalProp isModalShowing={this.state.isModalShowing}>
                <hr />
                <div className="rPaddingTop">
                  <h1 className="rReviewTitle">Reviews</h1>
                  <Reviews
                    isModalShowing={this.state.isModalShowing}
                    toggleModal={this.toggleModal}
                    reviews={this.state.reviews}
                    formatDate={this.formatDate}
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
              </ModalProp>
            </div>
            <hr />
          </div>
        </div>
      </div>
    );
  }
}

export default App;