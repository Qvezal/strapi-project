import styles from "./style.module.css"

export default function Container({
  children,
  blockType,
  onClick,
  layoutForm,
  style,
  className
} : { 
  children: React.ReactNode,
  blockType?: string,
  layoutForm?: string
  onClick?: (event: any) => void,
  style?: string,
  className?: string
}) {

  let container_styles = styles.container;
  container_styles += " " + styles[layoutForm || 'vertical'];
  container_styles += " " + [styles[blockType || 'default'] || styles["default"]];
  container_styles += " " + (className ? className : '');

  if (style) {
    container_styles += " " + styles[style];
  }

  return (
    <div className={container_styles} onClick={onClick}>
      {children}
    </div>
  )
}