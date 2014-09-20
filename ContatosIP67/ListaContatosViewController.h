//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios4548 on 30/08/14.
//  Copyright (c) 2014 ios4548. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListaContatosProtocol.h"

@interface ListaContatosViewController : UITableViewController<ListaContatosProtocol, UIActionSheetDelegate>{
    Contato *contatoSelecionado;
}

@property (strong) NSMutableArray *contatos;
@property NSInteger linhaDestaque;

-(void)exibeMaisAcoes: (UIGestureRecognizer *)gesture;

@end
