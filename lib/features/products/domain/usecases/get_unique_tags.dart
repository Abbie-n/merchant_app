import 'package:dartz/dartz.dart';
import 'package:trade_peer/core/errors/failure.dart';
import 'package:trade_peer/core/usescases/usecase.dart';
import 'package:trade_peer/features/Offers/data/models/create_offer_request.dart';
import 'package:trade_peer/features/Offers/domain/entities/my_offers.dart';
import 'package:trade_peer/features/Offers/domain/repositories/my_offers_repository.dart';

class CreateOffersUseCase implements UseCase<MyOffers, CreateOfferRequest> {
  final MyOffersRepository repository;

  CreateOffersUseCase(this.repository);

  @override
  Future<Either<Failure, MyOffers>> call(CreateOfferRequest params) async {
    return await repository.createOffer(params);
  }
}
