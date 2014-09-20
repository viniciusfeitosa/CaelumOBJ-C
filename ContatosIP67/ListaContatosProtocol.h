//
//  ListaContatosProtocol.h
//  ContatosIP67
//
//  Created by ios4548 on 20/09/14.
//  Copyright (c) 2014 ios4548. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@protocol ListaContatosProtocol <NSObject>

-(void)contatoAtualizado:(Contato *)contato;
-(void)contatoAdicionado:(Contato *)contato;

@end
