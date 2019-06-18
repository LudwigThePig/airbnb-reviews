import React from 'react';
import Reviews from './reviews';
import ReviewModal from './reviewModal';
import styled from 'styled-components';

const ModalProp = styled.div`
  &&& {
    opacity: ${props => props.isModalShowing ? "0.5" : "1.0"};
  }
`;

class App extends React.Component {
  
  static formatDate(date) {
    console.log(date)
    date = date.split('-')
    const now = new Date();
    const nowFormated= [now.getFullYear(), now.getMonth(), now.getDay()];
    date = date.map((item, i) => nowFormated[i] - item);
    if (date[0] > 1) {
      return `${date[0]} years ago`;
    } else if (date[0] === 1) {
      return 'a year ago';
    } else if (date[0] > 0) {
      return `${date[1]} months ago`;
    } else {
      return 'recently';
    }
  }
  
  constructor(props) {
    super(props);
    this.state = {
      reviews: props.data,
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

  render() {
    return (
      <div className="Reviews">
        <div id="rApp">
          <div className="rBodyContainer">
            <div style={{display: this.state.isModalShowing ? 'block' : 'none'}} className="rModalContainer">
              <ReviewModal 
                id="modal"
                isModalShowing={this.state.isModalShowing}
                isModalSelected={this.state.isModalSelected}
                selectModal={this.selectModal}
                toggleModal={this.toggleModal}
                reviews={this.state.reviews}
                formatDate={App.formatDate}
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