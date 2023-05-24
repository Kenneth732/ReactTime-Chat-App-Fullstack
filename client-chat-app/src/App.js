import React from 'react';
import Chatroom from './components/Chatroom';

const App = () => {
  const chatroomId = 1; // Replace with the actual chatroom ID

  return (
    <div>
      <h1>My Chat App</h1>
      <Chatroom chatroomId={chatroomId} />
    </div>
  );
};
export default App;

// import React from 'react';
// import Chatroom from './components/Chatroom';

// const App = () => {
//   const chatroomId = 'your_chatroom_id'; // Replace with the actual chatroom ID

//   return (
//     <div>
//       <h1>My Chat App</h1>
//       <Chatroom chatroomId={chatroomId} />
//     </div>
//   );
// };

// export default App;
