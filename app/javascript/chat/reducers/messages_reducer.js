import { FETCH_MESSAGES, MESSAGE_POSTED } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_MESSAGES: {
      return action.payload;
    }
    case MESSAGE_POSTED: {
      if (action.payload.error) {
        // error, don't do anything
        return state;
      } else {
        const copiedState = state.slice(0);
        copiedState.push(action.payload);
        return copiedState;
      }
    }
    default:
      return state;
  }
}
