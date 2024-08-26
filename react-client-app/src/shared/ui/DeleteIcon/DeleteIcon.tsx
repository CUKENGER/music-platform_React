import { FC, memo } from "react";
import styles from './DeleteIcon.module.scss'
import delete_icon from '../assets/delete_icon.svg'

interface DeleteContainerProps{
  onClick: () => void
}

const DeleteContainer:FC<DeleteContainerProps> = ({onClick}) => {

  return (
    <div className={styles.delete_container} onClick={onClick}>
      <img className={styles.delete_icon} src={delete_icon} alt="delete" />
    </div>
  );
};

export default memo(DeleteContainer);