//
//  Hometown.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 28/7/23.
//

import SwiftUI

struct Hometown: View {
    @State private var currentDate: Date = .init()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var createWeek: Bool = false
    @State private var currentWeekIndex: Int = 1
    @State private var tasks: [Task] = sampleTasks.sorted(by: {$1.creationDate > $0.creationDate})
    @State private var createNewTask: Bool = false
    /// Animation Namespace
    @Namespace private var animation
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
           /// Header View
            HeaderView()
            ScrollView(.vertical) {
                VStack{
                    /// Tasks View
                    TasksView()
                }
                .hSpacing(.center)
                .vSpacing(.center)
            }
            .scrollIndicators(.hidden)
        }
        .vSpacing(.top)
        .background(Color("background"))
        .overlay(alignment: .bottomTrailing, content: {
            Button {
                createNewTask.toggle()
            } label: {
                Image(systemName: "plus")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 55, height: 55)
                    .background(.blue.shadow(.drop(color: .black.opacity(0.25), radius: 5, x: 10, y: 10)), in: Circle())
            }
            .padding(15)

        })
        .onAppear{
            if weekSlider.isEmpty{
                let currentWeek = Date().fetchWeek()
                
                if let firstDate = currentWeek.first?.date{
                    weekSlider.append(firstDate.createPreviousWeek())
                }
                
                weekSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.createNextWeek())
                }
            }
        }
        .sheet(isPresented: $createNewTask) {
            NewTaskView()
                .presentationDetents([.height(300)])
                .interactiveDismissDisabled()
                .presentationCornerRadius(30)
                .presentationBackground(Color("background"))
        }
    }
    
    /// Header View
    @ViewBuilder
    func HeaderView()-> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundColor(.blue)
                Text(currentDate.format("YYYY"))
                    .foregroundColor(.gray)
            }
            .font(.title.bold())
            
            Text(currentDate.formatted(date:.complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            /// Week Slider
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self){ index in
                 let week = weekSlider[index]
                    WeekView(week)
                        .padding(.horizontal, 15)
                        .tag(index)
                }
            }
            .padding(.horizontal, -15)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
        }
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing, content: {
            Button {
                
            } label: {
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }

        })
        .padding(15)
        .background(.cyan.opacity(0.1))
        .onChange(of: currentWeekIndex) { newValue in
            if newValue == 0 || newValue == (weekSlider.count - 1){
                createWeek = true
            }
        }
    }
    
    /// Week View
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay])-> some View {
        HStack(spacing: 0) {
            ForEach(week){ day in
                VStack(spacing: 8) {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(isSameDate(day.date, currentDate) ? .white : .gray)
                        .frame(width: 35, height: 35)
                        .background(content: {
                            if isSameDate(day.date, currentDate){
                                Circle()
                                    .fill(.blue)
                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                            }
                            
                            /// Indicator to Show, Which is today's Date
                            if day.date.isToday{
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 5,height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y:12)
                            }
                        })
                        .background(.white.shadow(.drop(radius: 1)), in: Circle())
                }
                .hSpacing(.center)
                .contentShape(Rectangle())
                .onTapGesture {
                    /// Updateing Current Date
                    withAnimation(.spring()){
                        currentDate = day.date
                    }
                }
            }
        }
        .background{
            GeometryReader {
                let minX = $0.frame(in: .global).minX
                
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self) { value in
                        if value.rounded() == 15 && createWeek {
                            paginateWeek()
                            createWeek = false
                        }
                    }
            }
        }
    }
    
    /// Week View
    @ViewBuilder
    func TasksView()-> some View {
        VStack(alignment: .leading, spacing: 35) {
            ForEach($tasks){ $task in
                TaskRowView(task: $task)
                    .background(alignment: .leading) {
                        if tasks.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 8)
                                .padding(.bottom, -35)
                        }
                    }
            }
        }
        .padding([.vertical, .leading], 15)
        .padding(.top, 15)
    }
    
    func paginateWeek() {
        /// SafeCheck
        if weekSlider.indices.contains(currentWeekIndex) {
            
            if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
                ///  Inserting New Week at 0th Index and removeing Last Array Item
                weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
                ///  Appending New Week at Lasr Index and removing Last Array Item
                weekSlider.append(lastDate.createNextWeek())
                weekSlider.removeFirst()
                currentWeekIndex = weekSlider.count - 2
            }
        }
    }
}

struct Hometown_Previews: PreviewProvider {
    static var previews: some View {
        Hometown()
    }
}
