import { useEffect, useState } from 'react'
import styles from './App.module.scss'
import AppRouter from './AppRouter'
import Header from './components/Header'
import Navbar from './components/Navbar'
import Player from './components/Player'
import Loader from './UI/Loader'
import ScrollContainer from './components/ScrollContainer'
// import { useNavigate } from 'react-router-dom'
// import { useTypedSelector } from './hooks/useTypedSelector'

function App() {

  const [isLoading, setIsLoading] = useState(true)
  // const navigate = useNavigate()

  // const {isAuth} = useTypedSelector((state) => state.authReducer)

  useEffect(() => {
    const timer = setTimeout(() => {
      setIsLoading(false);
    }, 1500);
    return () => clearTimeout(timer);
  }, []);

  // useEffect(() => {
  //   if (!isAuth) {
  //     navigate('/login')
  //   }
  // }, [isAuth])

  if (isLoading) return (
    <div className={styles.loader_container}>
      <Loader />
    </div>
  )

  return (
    <>
    <div className={styles.header_container}>
          <Header />
        </div>
        <Navbar />

        <div className={styles.container}>
          <AppRouter />
        </div>
        
        <Player />
        
        <ScrollContainer />
    {/* {isAuth 
    ? (
      <>
        <div className={styles.header_container}>
          <Header />
        </div>
        <Navbar />

        <div className={styles.container}>
          <AppRouter />
        </div>
        
        <Player />
        
        <ScrollContainer />
      </>
    ) 
    : (
      <AppRouter/>
    )
    } */}
      
      
    </>
  )
}

export default App
