import React, { useState, useEffect } from "react";
import { Helmet } from "react-helmet";
import { Heading } from "../../components";
import Header from "../../components/Header";
import { db }from '../../firebase'
import { collection, getDocs, doc, updateDoc,onSnapshot } from "firebase/firestore";

export default function Dashboardpage() {


  const user = JSON.parse(localStorage.getItem('user'));
  const [showPopup, setShowPopup] = useState(false);
  const [lands, setLands] = useState([]);
  const [selectedUser, setSelectedUser] = useState(null);

  const [formData, setFormData] = useState({
    name: '',
    phone: '',
    id: '',
    coordinates: ''
  });

  const unsubscribe = onSnapshot(collection(db, 'Users'), (snapshot) => {
    const updatedLands = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
    setLands(updatedLands);
  });

  useEffect(() => {
    const fetchLands = async () => {
      const landsCollection = collection(db, 'Users');
      const landsSnapshot = await getDocs(landsCollection);
      const landData = landsSnapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
      setLands(landData);
    };

    fetchLands();
  }, []);

  const handleButton2Click = (user) => {
    setSelectedUser(user);
    setFormData({
      name: user.Fullname || '',
      phone: user['Mobile Phone Number'] || '',
      id: user.IDNumber || '',
      coordinates: user.Coordinates || ''
    });
    setShowPopup(true);
  };

  const handleClosePopup = () => {
    setShowPopup(false);
  };

  const handlePermitButtonClick = async (userId) => {
  
    const userRef = doc(db, 'Users', userId);
    await updateDoc(userRef, {
      status: 'permitted'
    });
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData(prevState => ({
      ...prevState,
      [name]: value
    }));
  };

  return (
    <>
      <Helmet>
        <title>ZLANDS</title>
        <meta name="description" content="Web site created using create-react-app" />
      </Helmet>
      <div className="relative">
      {showPopup && (
          <div className="fixed top-0 left-0 w-full h-full bg-black bg-opacity-70 flex justify-center items-center z-50">
            <div className="bg-white-A700 shadow-md rounded-md p-8 w-[400px] relative">
              <button className="absolute top-2 right-2 text-gray-600 hover:text-gray-800" onClick={handleClosePopup}>
                <svg className="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
              <h2 className="text-lg font-semibold mb-4">Popup Form</h2>
              <form>
                <div className="mb-4">
                  <label htmlFor="name" className="block text-sm font-medium text-gray-700">Name</label>
                  <input type="text" id="name" name="name" value={formData.name} onChange={handleInputChange} className="mt-1 p-2 border border-gray-300 rounded-md w-full" />
                </div>
                <div className="mb-4">
                  <label htmlFor="phone" className="block text-sm font-medium text-gray-700">Phone Number</label>
                  <input type="text" id="phone" name="phone" value={formData.phone} onChange={handleInputChange} className="mt-1 p-2 border border-gray-300 rounded-md w-full" />
                </div>
                <div className="mb-4">
                  <label htmlFor="id" className="block text-sm font-medium text-gray-700">ID Number</label>
                  <input type="text" id="id" name="id" value={formData.id} onChange={handleInputChange} className="mt-1 p-2 border border-gray-300 rounded-md w-full" />
                </div>
                <div className="mb-4">
                  <label htmlFor="coordinates" className="block text-sm font-medium text-gray-700">Coordinates</label>
                  <input type="text" id="coordinates" name="coordinates" value={formData.coordinates} onChange={handleInputChange} className="mt-1 p-2 border border-gray-300 rounded-md w-full" />
                </div>
                <button type="submit" className="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-8 rounded-md mt-4">Submit</button>
              </form>
            </div>
          </div>
        )}
        <div className={`flex flex-col w-full pb-[41px] gap-[62px] px-[41px] md:pb-5 md:px-5 bg-gray-900_01 ${showPopup ? 'filter blur-md' : ''}`}>
          <div className="flex flex-col items-end w-full mx-auto md:p-5 max-w-[1853px] ml-[40px]">
            <Header className="flex justify-between  w-[87%] " />
          </div>
          <div className="flex flex-col items-start w-full mb-[5px] gap-[52px] mx-auto md:p-5 max-w-[1663px]">
            <Heading size="5xl" as="h1" className="!text-white-A700 !font-karla text-shadow-ts">
              Welcome {user.email} To the Dashboard{" "}
            </Heading>
            <Heading size="5xl" as="h2" className="!text-white-A700 !font-karla text-shadow-ts">
              Recently added lands{" "}
            </Heading>
            <div className="gap-[46px] grid-cols-4 md:grid-cols-[1fr] grid">
            {lands.map((Users) => (
              <div className="bg-white-A700 shadow-md rounded-md p-8 px-[175px] justify-center mr-6 flex flex-col justify-center items-center">
                <h2 className="text-lg font-semibold mb-4">{Users.Fullname}</h2>
                <h2 className="text-lg font-semibold mb-4">Card Title</h2>
                <div className="flex justify-between">
                <button className={`bg-${Users.status === 'permitted' ? 'green' : 'blue'}-500 hover:bg-${Users.status === 'permitted' ? 'green' : 'blue'}-600 text-white font-semibold py-2 px-8 rounded-md mr-2`} onClick={() => handlePermitButtonClick(Users.id)}>
                      {Users.status === 'permitted' ? 'Permitted' : 'Not Permitted'}
                    </button>
                  <button className="bg-gray-500 hover:bg-gray-600 text-white font-semibold py-2 px-8 rounded-md ml-2" onClick={() => handleButton2Click(Users)}>
                    Button 2
                  </button>
                </div>
              </div>
               ))}
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
