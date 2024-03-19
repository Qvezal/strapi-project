import { field } from "@/types/form"
import styles from "./input.module.css"
import Minus from "./actions/minus"
import Plus from "./actions/plus"
import { masks } from "@/data/forms"
import { useMask } from '@react-input/mask';
import { useRef } from "react"

type props = {
  setting : field
  style: string,
  onChange?: (event: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => void,
  change_range? (name: string, action: 'plus' | 'minus') : void,
  value: string | number
}

export default function Input(props: props) {
  const labelStyle = styles.label + " " + styles['label-' + props.style];
  const inputRef = useMask(masks[props.setting.attributes.name]);

  if (props.setting.attributes.type === 'textarea') {
    return (
      <div className={styles.input_wrapper}>
        <div className={styles.textarea}>
          <textarea
            className={styles[props.style]}
            name={props.setting.attributes.name}
            onChange={props.onChange}
            placeholder=" "
            value={props.value}
            required={props.setting.attributes.required}
          />
          <label className={labelStyle}>
            {props.setting.attributes.placeholder+(props.setting.attributes.required ? "*" : "")}
          </label>
        </div>
      </div>
    )
  } else if (props.setting.attributes.type === 'range') {

    return(
      <div className={styles.range_wrapper}>
        <div className={styles.range_name}>
          <p>{props.setting.attributes.name}</p>
        </div>
        <div className={styles.range_input}>
          <div className={styles.range_info}>
            <button className={styles.minus} onClick={(e) => {e.preventDefault(); props.change_range!(props.setting.attributes.name, 'minus')}}><Minus/></button>
            <p>{props.value} {props.setting.attributes.placeholder}</p>
            <button className={styles.plus} onClick={(e) => {e.preventDefault(); props.change_range!(props.setting.attributes.name, 'plus')}}><Plus/></button>
          </div>
          <div className={styles.range_input_default}></div>
          <input
            className={styles.input + ' ' + styles.range}
            name={props.setting.attributes.name}
            type={props.setting.attributes.type}
            onChange={props.onChange}
            min={props.setting.attributes.range_from}
            max={props.setting.attributes.range_to}
            step={props.setting.attributes.step}
            value={props.value}
            required={props.setting.attributes.required}
          />
        </div>
      </div>
    )
  } else if (props.setting.attributes.type === 'label') {
    return (
      <div className={styles.input_wrapper}>
        <p className={styles.info_label}>
          {props.setting.attributes.name}
        </p>
      </div>
    )
  } else if (props.setting.attributes.name == 'phone') {
    return (
      <div className={styles.input_wrapper}>
        <input
          className={styles.input + ' ' + styles[props.style]}
          name={props.setting.attributes.name}
          onChange={props.onChange}
          placeholder=" "
          value={typeof props.value === 'string' ? props.value.replace(/(<([^>]+)>)/gi, '').replace(/\&nbsp;/g, ' ') : props.value}
          required={props.setting.attributes.required}
          ref={inputRef}
        />
        {
          props.setting.attributes.type != 'hidden' &&
          <label className={labelStyle}>
            {props.setting.attributes.placeholder+(props.setting.attributes.required ? "*" : "")}
          </label>
        }
        { props.setting.attributes.required &&
          <label className={styles.is_required}>
            {props.value == '' ? 'Обязательное поле' : 'Некорректное значение'}
          </label>
        }
      </div>
    )
  } else {
    return (
      <div className={styles.input_wrapper}>
        <input
          className={styles.input + ' ' + styles[props.style]}
          name={props.setting.attributes.name}
          type={props.setting.attributes.type}
          onChange={props.onChange}
          placeholder=" "
          value={typeof props.value === 'string' ? props.value.replace(/(<([^>]+)>)/gi, '').replace(/\&nbsp;/g, ' ') : props.value}
          required={props.setting.attributes.required}
        />
        {
          props.setting.attributes.type != 'hidden' &&
          <label className={labelStyle}>
            {props.setting.attributes.placeholder+(props.setting.attributes.required ? "*" : "")}
          </label>
        }
        { props.setting.attributes.required &&
          <label className={styles.is_required}>
            {props.value == '' ? 'Обязательное поле' : 'Некорректное значение'}
          </label>
        }
      </div>
    )
  }
}