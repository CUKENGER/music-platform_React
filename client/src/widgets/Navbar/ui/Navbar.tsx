import { NavTo } from '@/features';
import styles from './Navbar.module.scss';
import { UserAvatar } from '@/entities';


const Navbar = () => {

  return (
    <div className={styles.container}>
      <UserAvatar />
      <NavTo />
    </div>
  );
}

export default Navbar;
