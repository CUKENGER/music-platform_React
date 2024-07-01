import { ChangeEvent, FC, memo, useCallback, useMemo, useState } from "react";
import styles from './TrackProgress.module.scss';
import volumeIcon from '@/assets/volumeIcon.svg';
import audioManager from "@/services/AudioManager";
import { useTypedSelector } from "@/hooks/useTypedSelector";
import useActions from "@/hooks/useActions";
import muteIcon from '@/assets/muteIcon.svg';

interface TrackProgressProps {
  isVolume: boolean;
}

const TrackProgress: FC<TrackProgressProps> = ({ isVolume }) => {
  const audio = audioManager.audio;
  const [isMute, setIsMute] = useState(false);
  const [prevVolume, setPrevVolume] = useState(50);

  const volume = useTypedSelector(state => state.playerReducer.volume);
  const {currentTime, duration} = useTypedSelector(state => state.trackTimeReducer)
  const { setVolume, setCurrentTime } = useActions();

  const changeVolume = useCallback((e: ChangeEvent<HTMLInputElement>) => {
    if (audio) {
      const newVolume = Number(e.target.value) / 100;
      audio.volume = newVolume;
      setVolume(Number(e.target.value));
      setIsMute(newVolume === 0);
    }
  }, [audio, setVolume]);

  const changeCurrentTime = useCallback((e: ChangeEvent<HTMLInputElement>) => {
    if (audio && !isVolume) {
      audio.currentTime = Number(e.target.value);
      setCurrentTime(Number(e.target.value));
    }
  }, [audio, setCurrentTime, isVolume]);

  const handleMute = useCallback(() => {
    if (audio) {
      if (!isMute) {
        setPrevVolume(volume);
        audio.volume = 0;
        setVolume(0);
      } else {
        audio.volume = prevVolume / 100;
        setVolume(prevVolume);
      }
      setIsMute(!isMute);
    }
  }, [audio, isMute, volume, prevVolume, setVolume]);

  const inputVolumeStyle = useMemo(() => ({ 
    '--value': `${(volume / 100) * 100}%` 
  }),[volume]);

  const inputDurationStyle = useMemo(() => {
    if (!isVolume) {
      return { '--value': `${(currentTime / duration) * 100}%` };
    }
    return {};
  }, [isVolume, currentTime, duration]);

  return (
    <>
      {isVolume ? (
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
            style={inputVolumeStyle as any}
          />
        </div>
      ) : (
        <div className={styles.input_duration_container}>
          <input
            type="range"
            min={0}
            max={duration}
            value={currentTime}
            onChange={changeCurrentTime}
            className={styles.input_duration}
            style={inputDurationStyle as any}
          />
        </div>
      )}
    </>
  );
};

export default memo(TrackProgress);