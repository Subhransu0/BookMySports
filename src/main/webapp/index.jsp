<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Your Ticket</title>
<%@include file="component/allcss.jsp"%>
<style>
.carousel-item img {
	height: 300px; 
	object-fit: cover; 
}

.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 20px;
}

.doctor-image {
	max-width: 100%;
	border-radius: 10px;
	object-fit: cover;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	
	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item ">
				<img src="img/stadium5.jpg" class="d-block w-100"
					alt="stadium_picture">
			</div>
			<div class="carousel-item ">
				<img src="img/stadium1.jpg" class="d-block w-100"
					alt="stadium_picture">
			</div>

			<div class="carousel-item">
				<img src="img/champ2.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item active ">
				<img src="img/champ10.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item ">
				<img src="img/champ3.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container p-3">
		<p class="text-center fs-2">Recommended Features</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">
									<i class="fa-solid fa-money-check-dollar"></i> <strong>10%-15%
										CashBacks</strong>
								</p>
								<p>Get exciting cashback offers on every booking, ranging
									from 10% to 15%,your sporting experience even more rewarding!</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">
									<i class="fa-solid fa-plane"></i> <strong>International
										Tickets</strong>
								</p>
								<p>Book tickets for your favorite international sporting
									events and witness thrilling matches live across the globe.</p>
							</div>
  						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">
									<i class="fa-solid fa-xmark"></i> <strong>Cancellation
										Available</strong>
								</p>
								<p>We offer hassle-free ticket cancellations with minimal
									charges, allowing flexibility if your plans change.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">
									<i class="fa-solid fa-crown"></i> <strong>VIP Access</strong>
								</p>
								<p>Experience the thrill of sports like never before with
									VIP access to exclusive lounges, premium seating, and special
									perks.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<img src="img/worldcup.jpeg" class="doctor-image" alt="Doctor Image">
			</div>
		</div>
	</div>


	<div class="container p-5">
		<p class="text-center fs-1">Popular Stadiums</p>
		<div class="row">
			<!-- First Row -->
			<div class="col-sm-6 col-md-4 col-lg-4">
				<div class="paint-card">
					<img src="img/champ2.jpg" class="img-fluid" alt="Stadium 2" />
					<p class="mt-2 text-center">Home to thrilling matches, Stadium
						 offers a vibrant atmosphere and state-of-the-art facilities.</p>
				</div>
			</div>

			<div class="col-sm-6 col-md-4 col-lg-4">
				<div class="paint-card">
					<img src="img/champ3.jpg" class="img-fluid" alt="Stadium 4" />
					<p class="mt-2 text-center">This is renowned for its
						stunning architecture and passionate fans, making every game a
						memorable experience.</p>
				</div>
			</div>

			<div class="col-sm-6 col-md-4 col-lg-4">
				<div class="paint-card">
					<img src="img/champ5.jpg" class="img-fluid" alt="Stadium 6" />
					<p class="mt-2 text-center">With a rich history and modern
						amenities, Stadium  is the perfect venue for unforgettable
						sporting events.</p>
				</div>
			</div>
		</div>

		<div class="row mt-4">
			<!-- Second Row -->
			<div class="col-sm-6 col-md-4 col-lg-4">
				<div class="paint-card">
					<img src="img/champ6.jpg" class="img-fluid" alt="Stadium 6" />
					<p class="mt-2 text-center">Stadium is famous for hosting
						international matches and provides a world-class experience for
						all visitors.</p>
				</div>
			</div>

			<div class="col-sm-6 col-md-4 col-lg-4">
				<div class="paint-card">
					<img src="img/champ9.jpg" class="img-fluid" alt="Stadium 6" />
					<p class="mt-2 text-center">Known for its electrifying
						atmosphere, Stadium  offers fans a unique blend of entertainment
						and excitement.</p>
				</div>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-4">
				<div class="paint-card">
					<img src="img/champ10.jpg" class="img-fluid" alt="Stadium 6" />
					<p class="mt-2 text-center">Stadium  stands out with its
						innovative design and commitment to sustainability, making it a
						model for modern venues.</p>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>

</body>
</html>