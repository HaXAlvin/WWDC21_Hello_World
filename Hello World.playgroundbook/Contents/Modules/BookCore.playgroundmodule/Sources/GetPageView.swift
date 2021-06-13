//
//  GetPageView.swift
//  BookCore
//
//  Created by 薛竣祐 on 2021/4/12.
//

public func getPage1View(s:String) -> Page1View{
    return Page1View(wave:s)
}
public func getPage2View(s:String) -> Page2View{
    return Page2View(shake: s)
}
public func getPage3View(s:String) -> Page3View{
    return Page3View(hifive: s)
}
public func getPage4View(s:String) -> Page4View{
    return Page4View(thumbsUp: s)
}
public func getPage5View() -> Page5View{
    return Page5View()
}
public func getLiveView() -> AlwaysLiveView{
    return AlwaysLiveView()
}

