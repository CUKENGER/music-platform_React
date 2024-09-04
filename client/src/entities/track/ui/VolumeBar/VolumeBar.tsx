import { muteIcon, volumeIcon } from '@/shared'
import { useVolumeBar } from '../../model/useVolumeBar'
import styles from './VolumeBar.module.scss'


export const VolumeBar = () => {

  const {
    handleMute,
    isMute,
    volume,
    changeVolume,
    inputVolumeStyle
  } = useVolumeBar()

  return (
    <div className={styles.input_volume_container}>
      <img
        onClick={handleMute}
        className={styles.volume_icon}
        src={isMute ? muteIcon : volumeIcon}
        alt='volume Icon'
      />
      <input
        type="range"
        min={0}
        max={100}
        value={volume}
        onChange={changeVolume}
        className={styles.input_volume}
        style={inputVolumeStyle}
      />
    </div>
  )
}