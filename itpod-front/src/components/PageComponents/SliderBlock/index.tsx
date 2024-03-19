"use client"

import styles from './slider.module.css'
import useSlider from "@/utils/slider";

export default function ServerSlideBlock({lang, options} : {lang: string, options: any}) {

  const sliderOptions = {
      'data' :  options.servers.data,
      'lang' : lang,
      'type' : 'server',
      'style' : {
          'all' : styles,
          'slider' : styles.slider,
          'navigation' : styles.navigation,
          'count' : styles.count,
          'swiper': styles.swiper,
          'counter' : styles.counter
      },
      'options' : {
          'slide_view' : 1 ,
          'with_count' : true,
          'with_navigation' : true,
          'counter': true
      }
  };
  
  const {navigation, slider} = useSlider(sliderOptions);
   
  return (
    <div className={styles.slider_container}>
      {slider}
      {navigation}
    </div>
  )
}