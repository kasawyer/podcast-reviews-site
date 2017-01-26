/*jshint esversion: 6 */

import React, { Component } from 'react';
import Review from './Review';

class ReviewList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      podcastId: parseInt(this.props.podcastId),
      currentUserId: parseInt(this.props.currentUserId),
      admin: this.props.admin,
      reviews: [],
      message: "",
      refresh: false
    };
    this.componentDidMount = this.componentDidMount.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
    this.getReviews = this.getReviews.bind(this);
  }


  componentDidMount() {
    this.getReviews();
  }

  handleDelete(review_id) {
    if (confirm("Are you sure?")) {
      fetch(`/api/v1/podcasts/${this.state.podcastId}/reviews/${review_id}.json`, {
        method: 'delete'
      })
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
        let reviews = body.reviews;
        let message = body.message;
        this.setState({ reviews: reviews, message: message });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
    }
  }

  getReviews() {
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
      let handleDelete = () => {
        this.handleDelete(review.id);
      };
      reviews_array.push(
        <Review
        review={review}
        key={review.id}
        handleDelete={handleDelete}
        currentUserId={this.state.currentUserId}
        admin={this.state.admin}
        />
      );
    }.bind(this));
    return (
      <div>
        <p>{this.state.message}</p>
        {reviews_array}
      </div>
    );
  }
}

export default ReviewList;
