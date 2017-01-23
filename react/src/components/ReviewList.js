import React, { Component } from 'react';
import Review from './Review';

class ReviewList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      podcastId: parseInt(this.props.podcastId),
      reviews: []
    }
    this.componentDidMount = this.componentDidMount.bind(this);
  }

  componentDidMount() {
    fetch(`/api/v1/podcasts/${this.state.podcastId}/reviews`)
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status}, (${response.statusText})`;
        let error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      let reviews = body;
      this.setState({ reviews: reviews });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let reviews_array = [];
    this.state.reviews.forEach(function(review) {
      reviews_array.push(
        <Review
        review={review}
        key={review.id}
        />
      );
    });
    return (
      <div>
        <h1>Reviews</h1>
        {reviews_array}
      </div>
    );
  }
}

export default ReviewList;
