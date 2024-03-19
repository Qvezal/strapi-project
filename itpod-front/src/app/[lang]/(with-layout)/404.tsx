import Button from "@/components/std/Button";
import styles from './404.module.css';
import Container from "@/components/std/Container";

export default function NotFound() {
  return (
    <Container>
      <div className={styles.wrapper}>
        <h1>404</h1>
        <p>Похоже, эта страница отсутствует. Попробуйте вернуться на главную и попробовать ещё раз</p>
        <a href="/">
          <Button style="primary" className={styles.button}>
            На главную
          </Button>
        </a>
      </div>
    </Container>
    
  )
}