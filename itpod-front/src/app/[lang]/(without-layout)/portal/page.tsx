import Container from "@/components/std/Container";
import styles from './portal.module.css'
import logo from './Logo-dark.svg'
import Image from "next/image";

export default function Portal() {
  return (
    <div className={styles.wrapper}>
      <Container className={styles.container}>
        <div className={styles.header}>
          <Image src={logo} alt="logo" className={styles.img}/>
          <h4>Надежное железо для серьезных задач</h4>
        </div>
        <div className={styles.main}>
          <h1>
            Наш портал в стадии разработки. <span>Мы делаем все возможное, чтобы запустить его как можно скорее.</span>
          </h1>
          <h4>Свяжитесь с нами <a href="mailto:info@itpod.com">info@itpod.com</a></h4>
        </div>
      </Container>
    </div>
  )
}