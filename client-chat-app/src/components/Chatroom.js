import React, { useState, useEffect } from 'react';

const Chatroom = ({ chatroomId }) => {
  const [messages, setMessages] = useState([]);
  const [newMessage, setNewMessage] = useState('');

  useEffect(() => {
    fetch(`/api/chatrooms/${chatroomId}`)
      .then(response => response.json())
      .then(data => {
        console.log(data); // Check the data structure here
        setMessages(data.chatroom.messages); // Access messages array inside the chatroom object
      })
      .catch(error => {
        console.error('Error fetching messages:', error);
      });
  }, [chatroomId]);

  const handleFormSubmit = event => {
    event.preventDefault();

    // Send a POST request to create a new message
    fetch(`/api/chatrooms/${chatroomId}/messages`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ content: newMessage })
    })
      .then(response => response.json())
      .then(data => {
        setMessages(prevMessages => [...prevMessages, data]);
        setNewMessage('');
      })
      .catch(error => {
        console.error('Error sending message:', error);
      });
  };

  const handleInputChange = event => {
    setNewMessage(event.target.value);
  };

  return (
    <div>
      <h2>Chatroom</h2>
      <div>
        {messages ? (
          messages.map(message => <p key={message.id}>{message.content}</p>)
        ) : (
          <p>No messages found.</p>
        )}
      </div>

      <form onSubmit={handleFormSubmit}>
        <input
          type="text"
          value={newMessage}
          onChange={handleInputChange}
          placeholder="Type your message"
        />
        <button type="submit">Send</button>
      </form>
    </div>
  );
};

export default Chatroom;
















// import React, { useState, useEffect } from 'react';

// const Chatroom = ({ chatroomId }) => {
//     const [messages, setMessages] = useState([]);
//     const [newMessage, setNewMessage] = useState('');

//     useEffect(() => {
//         fetch(`/api/chatrooms/${chatroomId}`)
//             .then(response => response.json())
//             .then(data => {
//                 console.log(data); // Check the data structure here
//                 setMessages(data.chatroom.messages); // Access messages array inside the chatroom object
//             })
//             .catch(error => {
//                 console.error('Error fetching messages:', error);
//             });
//     }, [chatroomId]);



//     const handleFormSubmit = event => {
//         event.preventDefault();

//         // Send a POST request to create a new message
//         fetch(`/api/chatrooms/${chatroomId}/messages`, {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/json'
//             },
//             body: JSON.stringify({ content: newMessage })
//         })
//             .then(response => response.json())
//             .then(data => {
//                 setMessages(prevMessages => [...prevMessages, data]);
//                 setNewMessage('');
//             })
//             .catch(error => {
//                 console.error('Error sending message:', error);
//             });
//     };
//     const handleInputChange = event => {
//         setNewMessage(event.target.value);
//     };

//     return (
//         <div>
//             <h2>Chatroom</h2>
//             {/* <div>
//         {messages.map(message => (
//           <p key={message.id}>{message.content}</p>
//         ))}
//       </div> */}
//             <div>
//                 {messages ? (
//                     messages.map(message => (
//                         <p key={message.id}>{message.content}</p>
//                     ))
//                 ) : (
//                     <p>No messages found.</p>
//                 )}
//             </div>

//             <form onSubmit={handleFormSubmit}>
//                 <input
//                     type="text"
//                     value={newMessage}
//                     onChange={handleInputChange}
//                     placeholder="Type your message"
//                 />
//                 <button type="submit">Send</button>
//             </form>
//         </div>
//     );
// };

// export default Chatroom;


