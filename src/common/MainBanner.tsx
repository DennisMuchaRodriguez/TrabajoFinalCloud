import banner1 from '../assets/images/banner1.jpg';
import banner2 from '../assets/images/banner2.jpg';
import banner3 from '../assets/images/banner3.jpg';
import banner4 from '../assets/images/banner4.jpg'; // Nueva imagen
import banner5 from '../assets/images/banner5.jpg'; // Nueva imagen

function MainBanner() {
    return (
        <div id="carouselExampleCaptions" className="carousel slide" data-bs-ride="carousel">
            <div className="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" className="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
            </div>
            <div className="carousel-inner">
                <div className="carousel-item active">
                    <img src={banner1} className="d-block w-100" alt="..." />
                    <div className="carousel-caption d-none d-md-block">
                        <h5>ShootHormigas</h5>
                        <p>Game 2D for my web</p>
                    </div>
                </div>
                <div className="carousel-item">
                    <img src={banner2} className="d-block w-100" alt="..." />
                    <div className="carousel-caption d-none d-md-block">
                        <h5>PokemonCard</h5>
                        <p>Game 2D for my web</p>
                    </div>
                </div>
                <div className="carousel-item">
                    <img src={banner3} className="d-block w-100" alt="..." />
                    <div className="carousel-caption d-none d-md-block">
                        <h5>FreezerClick</h5>
                        <p>Game 2D for my web</p>
                    </div>
                </div>
                <div className="carousel-item">
                    <img src={banner4} className="d-block w-100" alt="..." />
                    <div className="carousel-caption d-none d-md-block">
                        <h5>BogerHungry</h5>
                        <p>Game 2D for my web</p>
                    </div>
                </div>
                <div className="carousel-item">
                    <img src={banner5} className="d-block w-100" alt="..." />
                    <div className="carousel-caption d-none d-md-block text-black">
                        <h5>RexGame</h5>
                        <p>Game 2D for my web</p>
                    </div>
                </div>
            </div>
            <button className="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                <span className="visually-hidden">Previous</span>
            </button>
            <button className="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span className="carousel-control-next-icon" aria-hidden="true"></span>
                <span className="visually-hidden">Next</span>
            </button>
        </div>
    )
}

export default MainBanner;