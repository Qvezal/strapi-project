import Arrow from '@/utils/icons/arrow/index';
import Server from './type/server';
import Default from './type/default/default';
import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/css';
import { Pagination, Scrollbar } from 'swiper/modules';
import { useCallback, useRef } from 'react';

type sliderOptions = {
  data: any,
  lang: string,
  type?: string, 
  style: {
    all?: any,
    slider: string,
    navigation?: string,
    count?: string,
    swiper?: string,
    counter?: string
  },
  options: {
    slide_view: number,
    with_count: boolean,
    with_navigation: boolean,
    counter: boolean
  }
}

export default function useSlider({data,lang, type, style, options}:sliderOptions) {

  const sliderRef = useRef<any>(null);

  const handlePrev = useCallback(() => {
    if (!sliderRef.current) return;
    sliderRef.current.swiper.slidePrev();
  }, []);

  const handleNext = useCallback(() => {
    if (!sliderRef.current) return;
    sliderRef.current.swiper.slideNext();
  }, []);

  //create navigation elements
  const navigation = 
    options.with_navigation &&
    <div className={style.navigation}>
      <div onClick={handlePrev}>
        <Arrow direction={'left'} stroke={true}/>
      </div>
      <div onClick={handleNext}>
        <Arrow direction={'right'} stroke={true} />
      </div>  
    </div>
  //test data for 'defaault' type of slider
  type defaultData = {
    id : number,
    title : string,
    tags : string[],
    link : string
  }

  const testData : defaultData[] = [
    { 'id' : 1,
      'title' : 'test_title1',
      'tags' : ['it', 'v-satck','itpod'],
      'link' : 'http://localhost:3000/ru-RU/slider'
    }
  ]
    

  // create sliders elem  IMPORTANT (for functional expansion add in switch case by type and blocks templates)

  const slides = data.map((slide:any, index: number) => {
    const slide_component = type === 'server' ? <Server data={slide} lang={lang} style={style}/> : <Default data={slide} lang={lang} style={style}/>;
    return (
    <SwiperSlide key={"slide" + type + index}>
      {options.counter &&
      <div className={style.counter}><span>{index+1 < 10 ? `0${index+1}` : index+1}</span>/{data.length < 10 ? `0${data.length}` : data.length}</div>
      }
      {slide_component}
    </SwiperSlide>
      )
  })

  const slider = (
  <Swiper
    ref={sliderRef}
    modules={[Pagination, Scrollbar]}
    scrollbar={{draggable: true}}
    direction="horizontal"
    slidesPerView={1.1}
    spaceBetween={10}
    grabCursor={true}
    className={style.swiper}
    breakpoints={{
      992: {
        slidesPerView:1.15,
        spaceBetween: 16
      },
      1200: {
        slidesPerView:1,
        spaceBetween: 20,
        scrollbar: false,
      },
    }}
  >
    {slides}
  </Swiper>
  )
  
  return {navigation, slider}
}