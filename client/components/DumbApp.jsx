import React from 'react';
import moment from 'moment';
import Axios from 'axios';
import styled from 'styled-components';

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      reviews: [],
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
    return moment(new Date(date)).fromNow().toString();
  }

  sortByDate(reviews) {
    return reviews.sort((a, b) => new Date(b.date) - new Date(a.date));
  }

  componentDidMount() {
    Axios({
      url: `http://${document.location.hostname}:3004/api/listings/reviews/${Math.floor(Math.random() * 999999 / 2) + 499980}`,
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
              {/* <ReviewModal
                id="modal"
                isModalShowing={this.state.isModalShowing}
                isModalSelected={this.state.isModalSelected}
                selectModal={this.selectModal}
                toggleModal={this.toggleModal}
                reviews={this.state.reviews}
                formatDate={this.formatDate}
              /> */}
              <p>Bob is your uncle!</p>
            </div>
            <hr />
          </div>
        </div>
      </div>
    );
  }
}

export default App;