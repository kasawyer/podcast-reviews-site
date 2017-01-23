import React, { Component } from 'react';
import Upvote from './Upvote';
import Downvote from './Downvote';

class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: ""
    };
    this.componentWillMount = this.componentWillMount.bind(this);
  }

  componentWillMount() {
    fetch(`/api/v1/reviews/${this.props.review.id}/users.json`)
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
      let user = body;
      this.setState({ user: user });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return (
      <div className="review-list-item">
        <p>Rating: {this.props.review.rating}</p>
        <p>{this.state.user.name}</p>
        <p>{this.props.review.body}</p>
        <Upvote />
        <Downvote />
      </div>

    );
  }
}

export default Review;
