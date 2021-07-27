import UIKit

/*
 문제 출처 : https://programmers.co.kr/learn/courses/30/lessons/42587
 문제 설명
 일반적인 프린터는 인쇄 요청이 들어온 순서대로 인쇄합니다. 그렇기 때문에 중요한 문서가 나중에 인쇄될 수 있습니다. 이런 문제를 보완하기 위해 중요도가 높은 문서를 먼저 인쇄하는 프린터를 개발했습니다. 이 새롭게 개발한 프린터는 아래와 같은 방식으로 인쇄 작업을 수행합니다.

 1. 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼냅니다.
 2. 나머지 인쇄 대기목록에서 J보다 중요도가 높은 문서가 한 개라도 존재하면 J를 대기목록의 가장 마지막에 넣습니다.
 3. 그렇지 않으면 J를 인쇄합니다.
 예를 들어, 4개의 문서(A, B, C, D)가 순서대로 인쇄 대기목록에 있고 중요도가 2 1 3 2 라면 C D A B 순으로 인쇄하게 됩니다.

 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 알고 싶습니다. 위의 예에서 C는 1번째로, A는 3번째로 인쇄됩니다.

 현재 대기목록에 있는 문서의 중요도가 순서대로 담긴 배열 priorities와 내가 인쇄를 요청한 문서가 현재 대기목록의 어떤 위치에 있는지를 알려주는 location이 매개변수로 주어질 때, 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 return 하도록 solution 함수를 작성해주세요.
 
 제한사항
 현재 대기목록에는 1개 이상 100개 이하의 문서가 있습니다.
 인쇄 작업의 중요도는 1~9로 표현하며 숫자가 클수록 중요하다는 뜻입니다.
 location은 0 이상 (현재 대기목록에 있는 작업 수 - 1) 이하의 값을 가지며 대기목록의 가장 앞에 있으면 0, 두 번째에 있으면 1로 표현합니다.
 */

var priorities: [Int] = [2,1,2,3,2,2,1]
// 예시 priorities
var location: Int = 2
// 예시 location

var newList = priorities            // 주어지는 priorities는 let이기 때문에 문제 풀이를 위해 새로 지정해준다
var curIndex = location             // 주어지는 location은 let이기 때문에 문제 풀이를 위해 새로 지정해준다
var result = 0                      // 원하는 값이 출력되기까지 전에 출력된 값들의 갯수이다.

/*
 로직은 간단하다. 내가 출력하고자 하는 값이 index의 0의 자리에 오고 그 값이 array에서 가장 큰 값이되어 출력될때까지 계속해서
 돌려주는 while loop을 만드는 것이다.
 */
while true {
    /*
     첫번째 값이 가장 큰 값일 경우 array에 삭제해주고, 만약 그게 본인일 경우 while loop를 break 해준다. 아닐경우는
     현재 인덱스값을 한칸씩 앞당겨준다.
     */
    if newList.first! == newList.max() {
        newList.removeFirst()
        result += 1
        
        if location == 0 {
            break
        }
        else {
            location -= 1
        }
    }
    /*
     첫번째 값이 가장 큰 값이 아닐 경우 array의 가장 뒤로 보내주고, 현재 인덱스 값이 0보다 작아질 경우 가장 뒤 인덱스로
     돌려준다.
     */
    else {
        let removedItem = newList.removeFirst()
        newList.append(removedItem)
        
        if location == 0 {
            location = priorities.count-1
        }
        else {
            location -= 1
        }
    }
    print(result)
}
