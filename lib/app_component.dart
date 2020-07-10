import 'package:angular/angular.dart';
import 'package:angular_app/src/hero.dart';
import 'package:angular_app/src/hero_component.dart';
import 'package:angular_app/src/hero_service.dart';
import 'package:angular_app/src/mock_heroes.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, HeroComponent],
  providers: [ClassProvider(HeroService)],
)
class AppComponent implements OnInit {
  AppComponent(this._heroService);
  final HeroService _heroService;
  final title = 'Tour of Heroes';
  List<Hero> heroes;
  Hero selected;

  void ngOnInit() => _getHeroes();

  void _getHeroes() {
    _heroService.getAll().then((heroes) => this.heroes = heroes);
  }

  void onSelect(Hero hero) {
    selected = hero;
    print("hero selected ${selected.name}");
  }
}
