import { FC} from "react";
import styles from './DeleteContainer.module.scss'
import delete_icon from './delete_icon.svg'

interface DeleteContainerProps{
  onClick: (e: React.MouseEvent<HTMLDivElement>) => void
}

export const DeleteContainer:FC<DeleteContainerProps> = ({onClick}) => {

  return (
    <div className={styles.delete_container} onClick={onClick}>
      <img src={delete_icon} alt="delete" />
    </div>
  );
};
