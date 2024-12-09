import banner1 from '../assets/images/Logo.png';
import './MainHeader.css'; // Importa el archivo CSS

function MainHeader() {
    return (
        <header id="main-header">
            <div className='container'>
                <img src={banner1} alt="Logo" style={{ float: 'left', marginRight: '10px', width: '100px', height: 'auto' }} />
                <h1>Dengo-WEB</h1>
                <p>Final work on cloud solutions</p>
            </div>
        </header>
    )
}
export default MainHeader;