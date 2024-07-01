import { memo } from "react";
import styles from './Header.module.scss'
import burgerBtn from '@/assets/burgerBtn.svg'
import MainInput from "@/UI/MainInput/MainInput";

const Header = () => {
  return (
    <div className={styles.container}>
      {/* <div className={styles.burger_container}>
        <button>
          <img src={burgerBtn} alt="burger btn icon"/>
        </button>
      </div> */}
      <div className={styles.search_container}>
        <MainInput placeholder="Найти"/>
      </div>
    </div>
  );
};

export default memo(Header);