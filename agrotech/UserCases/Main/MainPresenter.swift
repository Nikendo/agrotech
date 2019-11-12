//
//  MainPresenter.swift
//  agrotech
//
//  Created by n.shmatov on 12.11.2019.
//  Copyright © 2019 n.shmatov. All rights reserved.
//

import Foundation
import UIKit

protocol MainPresenterInput {
    var output: MainPresenterOutput? { get set }
    func navigateTo()
    func viewDidLoad()
    func getTableData() -> BrandsInfo
}

protocol MainPresenterOutput {
    var presenter: MainPresenterInput? { get set }
    
}

class MainPresenter {
    
    private lazy var mockBrands: BrandsInfo = {
       return BrandsInfo(brands: [
        BrandModel(type: .rostselmash, image: UIImage(named: AgroBrand.rostselmash.rawValue), name: "Ростсельмаш", description: "Сегодня Ростсельмаш – группа компаний, в которую входят 13 предприятий, расположенных на 10 производственных площадках в 5 странах, выпускающих технику под брендами РОСТСЕЛЬМАШ.\n\nПродуктовая линейка компании включает в себя более 150 моделей и модификаций 24 типов техники, в том числе зерно- и кормоуборочных комбайнов, тракторов, опрыскивателей, кормозаготовительного и зерноперерабатывающего оборудования и др.\n\nРеализация техники Ростсельмаш, ее предпродажная подготовка и сервисное обслуживание осуществляется через развернутую по странам присутствия на 4 континентах дилерскую сеть компании."),
        BrandModel(type: .claas, image: UIImage(named: AgroBrand.claas.rawValue), name: "CLAAS", description: "Компания CLAAS является европейским лидером по производству сельскохозяйственной техники. Компания была основана в 1913 году немецким предпринимателем и изобретателем Августом Клаас на территории одной из самых успешно развивающихся федеральных земель Германии - Северной Рейн-Вестфалии.\nЗа столетнюю историю компанией CLAAS были освоены рынки сельского хозяйства большинства стран мира, за эти годы компания диверсифицировала свое производство и в продуктовую линейку на данный момент входят:\n\n• Тракторы\n• Зерноуборочные комбайны\n• Техника для кормозаготовки\n• Силосоуборочные комбайны\n• Телескопические погрузчики\n\nДеятельность концерна представлена по всему миру: заводы расположены в Германии, Франции, США, России, Индии, Венгрии, Китае. 11000 человек вносят свой вклад в развитие CLAAS во всем мире."),
        BrandModel(type: .deutz_fahr, image: UIImage(named: AgroBrand.deutz_fahr.rawValue), name: "DEUTZ-FAHR", description: "Долгая история компании DEUTZ-FAHR тесно связана с именем Николауса Аугуста Отто, который в 1864 году основал в Кëльне моторостроительный завод N.A. Otto & Cie., переименованный позднее в Klöckner-Humboldt-Deutz AG (KHD), и вскоре после этого изобрел первый в истории четырехтактный двигатель внутреннего сгорания."),
        BrandModel(type: .john_deere, image: UIImage(named: AgroBrand.john_deere.rawValue), name: "John Deere", description: "Американская машиностроительная компания, выпускающая сельскохозяйственную, строительную и лесозаготовительную технику. Крупнейший в мире (на 2009 год) производитель сельскохозяйственной техники. Штаб-квартира компании расположена в городе Молин (штат Иллинойс).\n\nКомпания основана в 1837 году американским кузнецом и промышленником, изобретателем стального плуга Джоном Диром. В 1869 году предприятие получило статус корпорации. В 1907 году Deere & Company выпускала целую линейку стальных плугов, культиваторов, сеялок и другого оборудования.")
       ])
    }()
    
    var output: MainPresenterOutput?
    
}

extension MainPresenter: MainPresenterInput {
    func navigateTo() {
        
    }
    
    func viewDidLoad() {
        
    }
    
    func getTableData() -> BrandsInfo {
        return mockBrands
    }
}


