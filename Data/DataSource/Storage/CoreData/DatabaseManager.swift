//
//  DatabaseManagerArticle.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/18/20.
//

import Foundation
import CoreData

open class DatabaseManager {
    
    public static let standard = DatabaseManager()

    //Returns the current Persistent Container for CoreData
    class func getContext () -> NSManagedObjectContext {
        return DatabaseManager.persistentContainer.viewContext
    }


    static var persistentContainer: NSPersistentContainer = {
        //The container that holds both data model entities
        let container = NSPersistentContainer(name: "JRListArticle")

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }


        })
        return container
    }()

    // MARK: - Core Data Saving support
    class func saveContext() {
        let context = self.getContext()
        if context.hasChanges {
            do {
                try context.save()
                print("Data Saved to Context")
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    /* Support for GRUD Operations */

    // GET / Fetch / Requests
    class func getAllArticles() -> Array<Article> {
        let all = NSFetchRequest<Article>(entityName: "Article")
        var allArticles = [Article]()

        do {
            let fetched = try DatabaseManager.getContext().fetch(all)
            allArticles = fetched
        } catch {
            let nserror = error as NSError
            //TODO: Handle Error
            print(nserror.description)
        }

        return allArticles
    }

    // Get Article by articleId
    class func getArticle(fromId articleId: String) -> Article? {
        let requested = NSFetchRequest<Article>(entityName: "Article")
        requested.predicate = NSPredicate(format: "articleId == %@", articleId)

        do {
            let fetched = try DatabaseManager.getContext().fetch(requested)

            //fetched is an array we need to convert it to a single object
            if (fetched.count > 1) {
                //TODO: handle duplicate records
            } else {
                return fetched.first //only use the first object..
            }
        } catch {
            let nserror = error as NSError
            //TODO: Handle error
            print(nserror.description)
        }

        return nil
    }
    
    class func getAllTrashArticles() -> Array<TrashArticle> {
        let all = NSFetchRequest<TrashArticle>(entityName: "TrashArticle")
        var allArticles = [TrashArticle]()

        do {
            let fetched = try DatabaseManager.getContext().fetch(all)
            allArticles = fetched
        } catch {
            let nserror = error as NSError
            //TODO: Handle Error
            print(nserror.description)
        }

        return allArticles
    }
    
    class func getTrashArticle(fromId articleId: String) -> TrashArticle? {
        let requested = NSFetchRequest<TrashArticle>(entityName: "TrashArticle")
        requested.predicate = NSPredicate(format: "articleId == %@", articleId)

        do {
            let fetched = try DatabaseManager.getContext().fetch(requested)

            //fetched is an array we need to convert it to a single object
            if (fetched.count > 1) {
                //TODO: handle duplicate records
            } else {
                return fetched.first //only use the first object..
            }
        } catch {
            let nserror = error as NSError
            //TODO: Handle error
            print(nserror.description)
        }

        return nil
    }

    // REMOVE / Delete
    class func deleteArticle(forId articleId: String) -> Bool {
        let success: Bool = true

        let requested = NSFetchRequest<Article>(entityName: "Article")
        requested.predicate = NSPredicate(format: "articleId == %@", articleId)


        do {
            let fetched = try DatabaseManager.getContext().fetch(requested)
            for article in fetched {
                DatabaseManager.getContext().delete(article)
            }
            return success
        } catch {
            let nserror = error as NSError
            //TODO: Handle Error
            print(nserror.description)
        }

        return !success
    }
    
    func addNewArticlesToCoreData(_ articles: [HitModel]) {
        
        for article in articles {
            let entity = NSEntityDescription.entity(forEntityName: "Article", in: DatabaseManager.getContext())
            let newArticle = NSManagedObject(entity: entity!, insertInto: DatabaseManager.getContext())
            
            guard validateArticleSave(article.articleId ?? "") else{
                return
            }
            newArticle.setValue(article.createdAt, forKey: "createdAt")
            newArticle.setValue(article.articleId, forKey: "articleId")
            newArticle.setValue(article.storyTitle, forKey: "storyTitle")
            newArticle.setValue(article.storyUrl, forKey: "storyUrl")
        }
        print(DatabaseManager.getAllTrashArticles().count)
    }
    
    func addTrashArticlesToCoreData(_ articleId: String) {
        print(DatabaseManager.getAllTrashArticles().count)
        let entity = NSEntityDescription.entity(forEntityName: "TrashArticle", in: DatabaseManager.getContext())
        let newTrashArticle = NSManagedObject(entity: entity!, insertInto: DatabaseManager.getContext())
        newTrashArticle.setValue(articleId, forKey: "articleId")
        print(DatabaseManager.getAllTrashArticles().count)
        
    }
    
    func validateArticleSave(_ articleId: String)->Bool{
        guard let _ = DatabaseManager.getTrashArticle(fromId: articleId) else{return true}
        return false
    }
    
    // Delete all Articles from CoreData
    func deleteAllArticles() {
        do {
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
            let deleteALL = NSBatchDeleteRequest(fetchRequest: deleteFetch)

            try DatabaseManager.getContext().execute(deleteALL)
            DatabaseManager.saveContext()
        } catch {
            print ("There is an error in deleting records")
        }
    }
    
}




