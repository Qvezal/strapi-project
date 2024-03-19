import { ReactNode } from "react";
import styles from './overlay.module.css'
import Container from "../Container";
export default function Overlay(
  {children,
    close,
    wrapper,
    className
  }: {children:ReactNode,
    close: () => void,
    wrapper?: string,
    className?:string
  }) {

  return (
  <div className={styles.overlay + ' ' + className} onClick={(event) => {event.preventDefault(); close();}}>
    <Container style={"overlay"} onClick={(event) => {event.preventDefault(); close();}}>
      <div onClick={event => {event.stopPropagation()}} className={styles.wrapper + ' ' + wrapper}>
          {children}
      </div>
    </Container>
  </div>)
}